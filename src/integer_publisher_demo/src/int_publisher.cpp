#include <chrono>
#include <functional>
#include <memory>
#include <string>

#include "rclcpp/rclcpp.hpp"
#include "std_msgs/msg/int64.hpp"

using namespace std::chrono_literals;

/* This example creates a subclass of Node and uses std::bind() to register a
 * member function as a callback from the timer. */

class MinimalPublisher : public rclcpp::Node {
public:
  MinimalPublisher() : Node("int_publisher"), count_(0), message_() {
    publisher_ = this->create_publisher<std_msgs::msg::Int64>("message", 10);
    timer_ = this->create_wall_timer(
        10ms, std::bind(&MinimalPublisher::timer_callback, this));
  }

private:
  void timer_callback() {
    message_.data = ++count_;
    if (count_ % 100 == 0) {
      RCLCPP_INFO(this->get_logger(), "Published: '%lu' messages",
                  message_.data);
    }
    publisher_->publish(message_);
  }
  rclcpp::TimerBase::SharedPtr timer_;
  rclcpp::Publisher<std_msgs::msg::Int64>::SharedPtr publisher_;
  size_t count_;
  std_msgs::msg::Int64 message_;
};

int main(int argc, char *argv[]) {
  rclcpp::init(argc, argv);
  rclcpp::spin(std::make_shared<MinimalPublisher>());
  rclcpp::shutdown();
  return 0;
}