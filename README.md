# Zero copy evaluation

# deps
```
sudo apt install ros-galactic-test-msgs ros-galactic-cyclonedds ros-galactic-rmw-cyclonedds-cpp
sudo apt install heaptrack
```

# build
```
colcon build
```

# run zerocopy cyclone-dds
```
# terminal 0
/opt/ros/${ROS_DISTRO}/bin/iox-roudi -c roudi_config.toml

# terminal 1
source setup_cyclone.sh
ros2 run fixed_size_image_transport image_transport_publisher 10 1080p

# terminal 2
source setup_cyclone.sh
ros2 run fixed_size_image_transport image_transport_subscriber 1080p
```

# run heap memory benchmark
```
# terminal 0
/opt/ros/${ROS_DISTRO}/bin/iox-roudi -c roudi_config.toml

# terminal 1
source setup_cyclone.sh
heaptrack ./install/integer_publisher_demo/lib/integer_publisher_demo/int_publisher
```