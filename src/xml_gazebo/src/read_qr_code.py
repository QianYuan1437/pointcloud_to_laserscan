import cv2
from pyzbar.pyzbar import decode

def read_qr_code(image_path):
    # 使用 OpenCV 读取图像
    img = cv2.imread(image_path)

    # 使用 pyzbar 解码 QR 码
    decoded_objects = decode(img)

    # 如果二维码被成功解码，打印出二维码中的数据
    for obj in decoded_objects:
        print(f"Data: {obj.data.decode('utf-8')}")
        print(f"Type: {obj.type}")

if __name__ == "__main__":
    # 输入你要读取的 QR 码图片路径
    qr_image_path = "/home/zhao/WS/msfl_ws/src/xml_gazebo/qr/0_x300.0_y300.0.png"  # 例如这里是生成的二维码文件

    read_qr_code(qr_image_path)
