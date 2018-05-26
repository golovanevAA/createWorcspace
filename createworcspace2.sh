# Create work area proba 
if `mkdir -p ~/$1/src >nul 2>nul`
	echo "Ok mkdir"
	then
	 	cd $1/src 
		if `catkin_init_workspace >null 2>er.txt`
	 		then
	 			echo "Ok catkin_init"
	 			cd ..
	 			if `catkin_make >null 2>null`
	 				then
	 					echo "Ok catkin_make"
	 					cd src
	 					if `catkin_create_pkg my_service message_generation message_runtime roscpp >null 2>er.txt`
	 						then
	 							echo "Ok catkin_create_pkg"
	 							cd my_service
	 							mkdir srv/
	 							cd srv
	 							echo -e "string first\nstring second\n---\nstring sum" >> Addinst.srv
	 							cd ..
	 							sed -i '57,61 s/^#\ /\ /g' CMakeLists.txt
								sleep 1
								sed -i '71,74 s/^#\ /\ /g' CMakeLists.txt
								sleep 1
								sed -i '0,/roscpp/s/roscpp/roscpp\n  std_msgs/' CMakeLists.txt
								sleep 1
								sed -i '61d' CMakeLists.txt
								sleep 1
								sed -i 's/Service1.srv/Addinst.srv/' CMakeLists.txt
								sleep 1
								cd ..
								cd ..
								if `catkin_make >null 2>null`
			 						then
			 							echo "Ok catkin_make my_service"
			 							source devel/setup.bash
			 							cd ~
			 							if `cp subscriber.cpp $1/src/my_service/src/subscriber.cpp >null 2>null`
			 								then
			 									echo "Ok copy subscriber.cpp"
			 									if `cp publisher.cpp $1/src/my_service/src/publisher.cpp >null 2>null`
			 										then
			 											echo "Ok copy publisher.cpp"
			 											cd ~/$1/src/my_service/
			 											sed -i 's/collide/collide\n add_executable(server\ src\/subscriber.cpp)\n add_executable(client\ src\/publisher.cpp)/' CMakeLists.txt 
														sleep 2
														sed -i 's/against/against\n target_link_libraries(client\ ${catkin_LIBRARIES})/' CMakeLists.txt
														sleep 2
														sed -i 's/against/against\n target_link_libraries(server\ ${catkin_LIBRARIES})/' CMakeLists.txt
														sleep 2
														cd ..
														cd ..
														if `catkin_make >null 2>null`
			 												then
			 													echo "Ok catkin_make my_service"
			 													source devel/setup.bash
			 												else
			 													echo "false catkin_make my_service"
			 											fi	
			 										else
			 											echo "False copy publisher.cpp"
			 											break
			 									fi
			 								else
			 									echo "False copy subscriber.cpp"
			 									break
			 							fi		
													
			 						else
			 							echo "false catkin_make my_service"
		 	    				fi
					 	fi				
	 				else
	 					echo "false catkin_make"
	 			fi
	 		else
	 		    echo "false catkin_init"
	 	fi	
	else
	 	echo "false mkdir"
fi
