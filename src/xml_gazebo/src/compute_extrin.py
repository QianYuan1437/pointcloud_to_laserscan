# 脚本用途：用于更新imu_link和velodyne之间的外参，修改LIO-SAM的launch文件中的外参
# 具体包括：extrinsicTrans、extrinsicRot和extrinsicRPY三个参数
# 使用方法：运行roslaunch robot_description robot.launch以启动模型，然后运行此脚本
import rospy
import tf
import tf.transformations as t

def compute_extrinsics():
    rospy.init_node('compute_extrinsics', anonymous=True)
    listener = tf.TransformListener()

    try:
        listener.waitForTransform('imu_link', 'velodyne', rospy.Time(0), rospy.Duration(10.0))
        (trans, rot) = listener.lookupTransform('imu_link', 'velodyne', rospy.Time(0))

        # Translation
        extrinsicTrans = trans
        print("extrinsicTrans: ", extrinsicTrans)

        # Rotation matrix
        rotation_matrix = t.quaternion_matrix(rot)
        extrinsicRot = rotation_matrix[:3, :3].flatten().tolist()
        print("extrinsicRot: ", extrinsicRot)

        # RPY
        euler = t.euler_from_quaternion(rot)
        extrinsicRPY = list(euler)
        print("extrinsicRPY: ", extrinsicRPY)

    except (tf.LookupException, tf.ConnectivityException, tf.ExtrapolationException):
        rospy.logerr("TF transform between imu_link and velodyne not found.")

if __name__ == '__main__':
    compute_extrinsics()