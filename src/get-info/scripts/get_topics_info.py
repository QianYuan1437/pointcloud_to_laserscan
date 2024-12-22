#!/usr/bin/env python
import rospy
from sensor_msgs.msg import Imu, Image, PointCloud2
from nav_msgs.msg import Odometry
from geometry_msgs.msg import PoseStamped
import tf
from tf.transformations import euler_from_quaternion

def imu_callback(data):
    rospy.loginfo("IMU Data: Linear Acceleration: x={:.2f}, y={:.2f}, z={:.2f}".format(
        data.linear_acceleration.x, data.linear_acceleration.y, data.linear_acceleration.z
    ))

def odom_callback(data):
    rospy.loginfo("Odometry: Position: x={:.2f}, y={:.2f}, z={:.2f}".format(
        data.pose.pose.position.x, data.pose.pose.position.y, data.pose.pose.position.z
    ))

def pointcloud_callback(data):
    rospy.loginfo("Received PointCloud data")

def tf_info():
    listener = tf.TransformListener()
    try:
        listener.waitForTransform('/base_link', '/camera', rospy.Time(0), rospy.Duration(5.0))
        (trans, rot) = listener.lookupTransform('/base_link', '/camera', rospy.Time(0))
        euler = euler_from_quaternion(rot)
        rospy.loginfo("TF Transform: Translation: {}, Rotation (RPY): {}".format(
            trans, euler))
    except tf.Exception as e:
        rospy.logwarn("TF Exception: {}".format(e))

def main():
    rospy.init_node('get_topics_info', anonymous=True)
    rospy.Subscriber('/imu', Imu, imu_callback)
    rospy.Subscriber('/odom', Odometry, odom_callback)
    rospy.Subscriber('/velodyne_points', PointCloud2, pointcloud_callback)

    rate = rospy.Rate(1)
    while not rospy.is_shutdown():
        tf_info()
        rate.sleep()

if __name__ == '__main__':
    try:
        main()
    except rospy.ROSInterruptException:
        pass
