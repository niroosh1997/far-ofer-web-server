FROM ros:humble-ros-base

RUN apt-get update

# RUN apt-get -y install ros-humble-rosbridge-server
RUN apt install -y python3-bson python3-pil python3-tornado



RUN git clone https://github.com/RobotWebTools/rosbridge_suite.git && cd rosbridge_suite && git checkout b0ae756
COPY rosbridge_websocket_launch.xml /rosbridge_suite/rosbridge_server/launch/rosbridge_websocket_launch.xml
COPY far-ofer-interfaces /far-ofer-interfaces

RUN /bin/bash -c "cd rosbridge_suite && source /opt/ros/humble/setup.bash && colcon build"

RUN /bin/bash -c "cd far-ofer-interfaces && source /opt/ros/humble/setup.bash && colcon build"




COPY ros_entrypoint.sh /

ENTRYPOINT [ "/ros_entrypoint.sh" ]

CMD [ "ros2", "launch", "rosbridge_server","rosbridge_websocket_launch.xml" ]
