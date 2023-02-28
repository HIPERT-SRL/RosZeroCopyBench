toTest=("VGA" "dVGA" "720p" "d720p" "1080p" "d1080p" "4k" "d4k")
dds=("cyclone" "fast")

for d in ${dds[@]}; do
    source setup_$d.sh
    mkdir -p results_$d/
    for i in ${toTest[@]}; do
        echo "testing $i"
        timeout 10 ros2 run fixed_size_image_transport image_transport_publisher 10 $i 2>/dev/null &
        timeout 10 ros2 run fixed_size_image_transport image_transport_subscriber $i 2> results_$d/$i.txt
    done
done

