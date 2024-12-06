import xml.etree.ElementTree as ET
import numpy as np
import csv
import os

def extract_id_pose(xml_file):
    # 解析 XML 文件
    tree = ET.parse(xml_file)
    root = tree.getroot()

    # 用于保存 id 和位置信息的列表
    data = []

    # 遍历所有 <PointInfo> 元素
    for point in root.findall('.//PointInfo'):
        id_value = point.find('id').text
        xpos = point.find('xpos').text
        ypos = point.find('ypos').text

        # 将 id, xpos, ypos 存储为数组并加入数据列表
        data.append([int(id_value), float(xpos), float(ypos)])

    return np.array(data)

def save_to_csv(data, output_file):
    # 将数据保存为 CSV 文件
    np.savetxt(output_file, data, delimiter=",", header="id,xpos,ypos", comments='', fmt='%d,%f,%f')

if __name__ == "__main__":

    # 设置输入输出文件路径
    xml_file = '../xml/FF.xml'  # 输入你的 XML 文件路径
    output_file = '../csv/id_pose.csv'

    # 检查是否存在输入输出文件夹
    if not os.path.exists(os.path.dirname(output_file)):
        # 如果不存在，报错
        raise FileNotFoundError(f"Output directory {os.path.dirname(output_file)} does not exist.")
    if not os.path.exists(os.path.dirname(xml_file)):
        # 如果不存在，报错
        raise FileNotFoundError(f"Input directory {os.path.dirname(xml_file)} does not exist.")

    # 提取数据
    data = extract_id_pose(xml_file)

    # 保存数据到 CSV 文件
    save_to_csv(data, output_file)

    print(f"Data saved to {output_file}")
