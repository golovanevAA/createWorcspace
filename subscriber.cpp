#include "ros/ros.h"
#include "my_service/Addinst.h"
#include <iostream>
//using namespace std;

bool add(my_service::Addinst::Request&req, my_service::Addinst::Response&res)
//bool add(service::Addinst::Request&req, service::Addinst::Response&res)
{
res.sum = req.first + req.second;
std::cout<<"request:x="<<req.first;
std::cout<<", request:y="<<req.second<<std::endl;
std::cout<<"sum="<<res.sum<<std::endl;
//ROS_INFO("request:x=%d,y=%d", req.first, req.second);
//ROS_INFO("sending back response:[%d]", res.sum);
return true;
}

int main(int argc, char **argv)
{
ros::init(argc, argv, "add_two_ints_server");
ros::NodeHandle n;
ros::ServiceServer service = n.advertiseService("add_two_ints", add);
ros::spin();
return 0;
}
