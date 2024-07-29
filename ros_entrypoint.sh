#!/bin/bash
set -e

ROS_PACKAGE="far-ofer-interfaces"

source "/opt/ros/$ROS_DISTRO/setup.bash" --

source "${ROS_PACKAGE}/operator/ros_exports.bash"
source "/${ROS_PACKAGE}/install/setup.bash"
source "/rosbridge_suite/install/setup.bash"

exec "$@"
