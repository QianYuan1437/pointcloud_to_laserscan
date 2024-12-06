import pandas as pd
import qrcode
import os

def generate_qr_code(data, qr_size=10):
    # 创建 QR 码
    qr = qrcode.QRCode(
        version=1,
        error_correction=qrcode.constants.ERROR_CORRECT_L,
        box_size=qr_size,
        border=4,
    )
    qr.add_data(data)
    qr.make(fit=True)
    
    # 生成二维码图片
    img = qr.make_image(fill='black', back_color='white')
    return img

def save_qr_code(img, file_path):
    # 保存 QR 码图像
    img.save(file_path)

def read_and_generate_qr_codes(csv_file, qr_size=10):
    # 读取 CSV 文件
    df = pd.read_csv(csv_file)

    # 创建保存 QR 码的目录
    qr_dir = '/home/zhao/WS/msfl_ws/src/xml_gazebo/qr'
    if not os.path.exists(qr_dir):
        os.makedirs(qr_dir)

    # 遍历每一行数据，生成 QR 码并保存
    for index, row in df.iterrows():
        # 拼接二维码内容：id, xpos, ypos
        qr_data = f"ID: {row['id']}, X: {row['xpos']}, Y: {row['ypos']}"
        
        # 生成 QR 码图像
        img = generate_qr_code(qr_data, qr_size)
        
        # 生成文件名并保存二维码
        file_name = f"{qr_dir}/{int(row['id'])}_x{row['xpos']}_y{row['ypos']}.png"
        save_qr_code(img, file_name)
        print(f"QR code saved at {file_name}")

if __name__ == "__main__":
    csv_file = '/home/zhao/WS/msfl_ws/src/xml_gazebo/csv/id_pose.csv'  # 输入生成的 CSV 文件路径

    # 生成 QR 码并保存
    read_and_generate_qr_codes(csv_file, qr_size=10)
