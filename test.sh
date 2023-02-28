toTest=("VGA" "dVGA" "720p" "d720p" "1080p" "d1080p" "4k" "d4k")
mkdir -p results_cyclone/
for i in ${toTest[@]}; do
    echo "testing $i"
    timeout 10 ros2 run fixed_size_image_transport image_transport_publisher 10 $i 2>/dev/null &
    timeout 10 ros2 run fixed_size_image_transport image_transport_subscriber $i 2> results/$i.txt
done