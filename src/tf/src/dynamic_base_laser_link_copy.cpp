#include "tf/transform_listener.h"
#include "ros/ros.h"
#include "tf2_ros/static_transform_broadcaster.h"
#include "geometry_msgs/TransformStamped.h"
#include "cmath"
#include "tf/LinearMath/Quaternion.h"
#include "tf2_ros/transform_broadcaster.h"

struct position
{
    float x;
    float y;
    float orientation_x;
    float orientation_y;
    float orientation_z;
    float orientation_w;
    float theta;
};

double getcarpose(tf::TransformListener &listener);
void pubPose(double carpose, double radius,double diffz); 

int main(int argc, char **argv)
{
    ros::init(argc, argv, "dynamic_base_laser_link");
    ros::NodeHandle n;
    tf::TransformListener listener_;
    ros::Rate rate(10.0);
    double distance_between_lidar_and_base_link_,height_between_lidar_and_base_link_;
    n.param("distance_between_lidar_and_base_link",distance_between_lidar_and_base_link_,0.08);
    n.param("height_between_lidar_and_base_link", height_between_lidar_and_base_link_ ,0.165);
    while (n.ok())
    {   
        double carpose;
        carpose = getcarpose(listener_);
        pubPose(carpose,distance_between_lidar_and_base_link_,height_between_lidar_and_base_link_);
        rate.sleep();
    }
    return 0;
}


double getcarpose(tf::TransformListener &listener)
{
    tf::StampedTransform transform;
    try
    {   
        listener.lookupTransform("map", "base_link", ros::Time(0), transform);
        double x = transform.getOrigin().x();
        double y = transform.getOrigin().y();
        double orientation_x = transform.getRotation().x();
        double orientation_y = transform.getRotation().y();
        double orientation_z = transform.getRotation().z();
        double orientation_w = transform.getRotation().w();
        tf::Quaternion quat( orientation_x,  orientation_y,  orientation_z,  orientation_w);
        tf::Matrix3x3 m(quat);
        double roll, pitch, yaw;
        m.getRPY(roll, pitch, yaw);
        double car_angle = yaw;
        return car_angle;
    }
    catch (tf::TransformException &ex)
    {
        ROS_ERROR("%s", ex.what());
    }
}


void pubPose(double carpose,double radius,double diffz)
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

