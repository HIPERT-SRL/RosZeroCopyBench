source install/setup.bash

SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"

# cyclone
export RMW_IMPLEMENTATION=rmw_cyclonedds_cpp
export CYCLONEDDS_URI=file://$SCRIPT_DIR/dds_cyclone.xml # to enable roudi zero copy
export CYCLONE_INCLUDE=/opt/ros/${ROS_DISTRO}/include
export CYCLONE_LIB=/opt/ros/${ROS_DISTRO}/lib/x86_64-linux-gnu