# Zero copy evaluation
![cyclone](https://user-images.githubusercontent.com/11562617/221888944-a1d783ea-4cf1-4f8a-9c93-e40bb3a09048.png)
![fastrtps](https://user-images.githubusercontent.com/11562617/221888956-1b0854ba-c7cf-474d-adc9-2710d8fde42f.png)


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

# run latency test on cyclone and fastrtps
```
./test.sh
```

# run heap memory benchmark
```
# terminal 0
/opt/ros/${ROS_DISTRO}/bin/iox-roudi -c roudi_config.toml

# terminal 1
source setup_cyclone.sh
heaptrack ./install/integer_publisher_demo/lib/integer_publisher_demo/int_publisher
```

# ref
https://github.com/karsten1987/fixed_size_ros2_demo
