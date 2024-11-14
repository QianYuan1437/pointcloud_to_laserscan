#include "ros/ros.h"
#include "tf2_ros/static_transform_broadcaster.h"
#include "geometry_msgs/TransformStamped.h"
#include "cmath"
#include "tf/LinearMath/Quaternion.h"
#include <tf2/LinearMath/Quaternion.h>
#include "tf2_ros/transform_broadcaster.h"

void pubPose(double radius,double diffz); 

int main(int argc, char **argv)
{
    ros::init(argc, argv, "dynamic_base_laser_link");
    ros::NodeHandle n;
    ros::Rate rate(100.0);
    double distance_between_lidar_and_base_link_,height_between_lidar_and_base_link_;
    n.param("distance_between_lidar_and_base_link",distance_between_lidar_and_base_link_,0.08);
    n.param("height_between_lidar_and_base_link", height_between_lidar_and_base_link_ ,0.165);
    while (n.ok())
    {   
        pubPose(distance_between_lidar_and_base_link_,height_between_lidar_and_base_link_);
        rate.sleep();
    }
    return 0;
}

void pubPose(double radius,double diffz)
{
    static tf2_ros::TransformBroadcaster broadcaster;
    geometry_msgs::TransformStamped tfs;
    tfs.header.frame_id = "base_link";
    tfs.header.stamp = ros::Time::now();
    tfs.child_frame_id = "base_laser_link";
    tfs.transform.translation.x = radius;
    tfs.transform.translation.y = 0;
    tfs.transform.translation.z = diffz;
    tf2::Quaternion qtn;
    qtn.setRPY(0, 0, 0);
    tfs.transform.rotation.x = qtn.getX();
    tfs.transform.rotation.y = qtn.getY();
    tfs.transform.rotation.z = qtn.getZ();
    tfs.transform.rotation.w = qtn.getW();
    broadcaster.sendTransform(tfs);
}

