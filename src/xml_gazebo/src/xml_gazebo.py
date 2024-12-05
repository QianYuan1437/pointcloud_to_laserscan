import os
import xml.etree.ElementTree as ET

# 读取XML文件并解析
def parse_xml(xml_file):
    tree = ET.parse(xml_file)
    root = tree.getroot()
    return root

# 生成Gazebo模型的代码
def generate_gazebo_model(id, xpos, ypos, width, height):
    # 创建一个模型块，按指定格式生成xml节点
    model_str = f"""
  <!-- Point {id} from XML -->
  <model name="point_{id}">
    <pose>{xpos} {ypos} 0.25 0 0 0</pose> <!-- Using xpos, ypos, and a fixed height -->
    <link name="link">
      <collision name="collision">
        <geometry>
          <box>
            <size>{width} {width} 0.1</size> <!-- width, height -->
          </box>
        </geometry>
      </collision>
      <visual name="visual">
        <geometry>
          <box>
            <size>{width} {width} 0.1</size> <!-- width, height -->
          </box>
        </geometry>
        <material>
          <ambient>0.7 0.7 0.7 1</ambient>
          <diffuse>0.7 0.7 0.7 1</diffuse>
        </material>
      </visual>
    </link>
  </model>
    """
    return model_str

# 生成整个world文件的结构
def generate_world_file(xml_file, output_file):
    root = parse_xml(xml_file)
    
    # 获取地图基本信息
    map_name = root.find('MapName').text
    map_qr_code = root.find('MapQRCode').text
    width = root.find('Width').text
    height = root.find('Height').text

    # Gazebo world文件的头部信息
    world_str = f"""<?xml version="1.0" ?>
<world name="{map_name}">
  <!-- Lighting setup -->
  <light name="sun" type="directional">
    <pose>0 0 10 0 0 0</pose>
    <diffuse>1 1 1 1</diffuse>
    <specular>0.5 0.5 0.5 1</specular>
    <attenuation>
      <range>100</range>
      <constant>0.9</constant>
      <linear>0.01</linear>
      <quadratic>0.001</quadratic>
    </attenuation>
  </light>

  <!-- Ground plane -->
  <model name="ground_plane">
    <pose>0 0 0 0 0 0</pose>
    <link name="link">
      <collision name="collision">
        <geometry>
          <plane>
            <normal>0 0 1</normal>
            <size>100 100</size>
          </plane>
        </geometry>
      </collision>
      <visual name="visual">
        <geometry>
          <plane>
            <normal>0 0 1</normal>
            <size>100 100</size>
          </plane>
        </geometry>
      </visual>
    </link>
  </model>
"""
    # 遍历每个PointInfo，生成模型
    for point in root.findall('PointInfo'):
        id = point.find('id').text
        xpos = point.find('xpos').text
        ypos = point.find('ypos').text
        width = point.find('width').text
        # 获取模型的Gazebo数据并添加到world文件中
        world_str += generate_gazebo_model(id, xpos, ypos, width, width)
    
    # 结束world文件结构
    world_str += "</world>"

    # 写入到文件
    with open(output_file, 'w') as f:
        f.write(world_str)
    print(f"Gazebo world file generated: {output_file}")

# 输入XML文件路径和输出Gazebo world文件路径
xml_file = "/home/zhao/WS/msfl_ws/src/xml_gazebo/xml/FF.xml"  # 输入你的XML文件路径
output_file = "/home/zhao/WS/msfl_ws/src/xml_gazebo/gazebo/real.world"  # 输出Gazebo world文件路径

# 检查XML文件路径是否存在
if not os.path.exists(xml_file):
    print(f"Error: XML file '{xml_file}' does not exist.")
else:
    print(f"XML file '{xml_file}' found.")

# 检查输出文件目录是否存在
output_dir = os.path.dirname(output_file)
if not os.path.exists(output_dir):
    print(f"Warning: Output directory '{output_dir}' does not exist. Creating it.")
    os.makedirs(output_dir)

generate_world_file(xml_file, output_file)

