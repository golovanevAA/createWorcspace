#include "ros/ros.h"
#include "my_service/Addinst.h"
#include <iostream>
int main(int argc, char **argv)
{
	ros::init(argc, argv, "add_ints_publisher");
	ros::NodeHandle n;
	ros::ServiceClient client = n.serviceClient<my_service::Addinst>("add_two_ints");
	my_service::Addinst srv;
while(ros::ok())
{
std::string a, b;
  std::cout <<"input the first word:";
	std::cin >>a;
  std::cout<<"input the second word:";
	std::cin >>b;
	srv.request.first = a;
	srv.request.second = b;
	if (client.call(srv))
		{
      std::cout<<"concatinate word = "<<srv.response.sum<<std::endl;
		}
	else
		{
			std::cout<<"Failed to call service add_two_ints"<<std::endl;
		return 1;
		}
}
return 0;
}
