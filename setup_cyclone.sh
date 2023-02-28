source /opt/ros/humble/setup.bash
source install/setup.bash

SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"

# cyclone
export RMW_IMPLEMENTATION=rmw_cyclonedds_cpp
export CYCLONEDDS_URI=file://$SCRIPT_DIR/dds_cyclone.xml # to enable roudi zero copy
export CYCLONE_INCLUDE=/opt/ros/humble/include
export CYCLONE_LIB=/opt/ros/humble/lib/x86_64-linux-gnu