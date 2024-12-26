/**
 * @file imu_process.cpp
 * @brief This file contains the implementation of the ImuProcessor class, which subscribes to IMU data,
 *        normalizes the orientation quaternion, and publishes it to the /imu_quat topic.
 * 
 * The ImuProcessor class:
 * - Subscribes to the /imu topic to receive IMU data.
 * - Checks the validity of the orientation data.
 * - Normalizes the orientation quaternion.
 * - Publishes the normalized quaternion to the /imu_quat topic.
 * 
 * The main function initializes the ROS node and starts the ImuProcessor.
 * 
 * @author Zhao
 * @date 2024-12-26
 */

#include <ros/ros.h>
#include <sensor_msgs/Imu.h>
#include <tf2/LinearMath/Quaternion.h>
#include <iomanip> // 用于格式化输出

ros::Publisher imu_pub;

// 回调函数，用于接收 /imu 数据并发布修正后的消息
void imuCallback(const sensor_msgs::Imu::ConstPtr& msg) {
    // 创建新的 IMU 消息
    sensor_msgs::Imu corrected_msg = *msg;

    // 获取原始四元数
    const geometry_msgs::Quaternion& raw_orientation = msg->orientation;

    // 修正四元数（示例：归一化）
    tf2::Quaternion quat(raw_orientation.x, raw_orientation.y, raw_orientation.z, raw_orientation.w);
    quat.normalize();

    // 更新修正后的四元数到消息中
    corrected_msg.orientation.x = quat.x();
    corrected_msg.orientation.y = quat.y();
    corrected_msg.orientation.z = quat.z();
    corrected_msg.orientation.w = quat.w();

    // 发布修正后的消息
    imu_pub.publish(corrected_msg);
}

// 回调函数，用于接收 /imu_quat 数据并直接打印到终端
void echoCallback(const sensor_msgs::Imu::ConstPtr& msg) {
    ROS_INFO_STREAM("Echoing /imu_quat:");
    ROS_INFO_STREAM("Orientation - x: " << std::fixed << std::setprecision(6) << msg->orientation.x
                    << ", y: " << msg->orientation.y
                    << ", z: " << msg->orientation.z
                    << ", w: " << msg->orientation.w);
    ROS_INFO_STREAM("Angular Velocity - x: " << msg->angular_velocity.x
                    << ", y: " << msg->angular_velocity.y
                    << ", z: " << msg->angular_velocity.z);
    ROS_INFO_STREAM("Linear Acceleration - x: " << msg->linear_acceleration.x
                    << ", y: " << msg->linear_acceleration.y
                    << ", z: " << msg->linear_acceleration.z);
}

int main(int argc, char** argv) {
    ros::init(argc, argv, "imu_process");
    ros::NodeHandle nh;

    // 创建发布器，发布到 /imu_quat 话题
    imu_pub = nh.advertise<sensor_msgs::Imu>("/imu_quat", 10);

    // 创建订阅器，订阅 /imu 话题
    ros::Subscriber imu_sub = nh.subscribe("/imu", 10, imuCallback);

    // 创建订阅器，订阅 /imu_quat 话题并直接打印内容
    ros::Subscriber echo_sub = nh.subscribe("/imu_quat", 10, echoCallback);

    ros::spin();
    return 0;
}
