# Zero copy evaluation

# build
```
colcon build
```

# run zerocopy cyclone-dds
```
# terminal 0
/opt/ros/humble/bin/iox-roudi -c roudi_config.toml

# terminal 1
source setup_cyclone.sh
ros2 run fixed_size_image_transport image_transport_publisher 10 1080p

# terminal 2
source setup_cyclone.sh
ros2 run fixed_size_image_transport image_transport_subscriber 1080p
```