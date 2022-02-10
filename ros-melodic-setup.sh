timeStamp="[ $(date "+%D %T") ]"
echo "$timeStamp" "Installing ROS"
echo ""

read -p "Enter desired catkin workspace path+name Default: [~/catkin_ws]: " path
path=${path:-~/catkin_ws}
echo $path

echo "$timeStamp" "Starting: setting up repositories"
echo ""
sudo sh -c 'echo "deb http://packages.ros.org/ros/ubuntu $(lsb_release -sc) main" > /etc/apt/sources.list.d/ros-latest.list' > /dev/null 2>&1
sudo apt -y install curl # if you haven't already installed curl
curl -s https://raw.githubusercontent.com/ros/rosdistro/master/ros.asc | sudo apt-key add -
sudo apt -y update
echo ""
echo "$timeStamp" "Finished: setting up repositories"

echo "$timeStamp" "Starting: Installing ROS"
echo ""
sudo apt -y install ros-melodic-desktop-full
echo ""
echo "$timeStamp" "Finished: Installing ROS"

echo "$timeStamp" "Starting: Installing rosdep/python-rosdep"
echo ""
sudo apt -y install python-rosdep python-rosinstall python-rosinstall-generator python-wstool build-essential
echo ""
echo "$timeStamp" "Finished: Installing rosdep/python-rosdep"

echo "$timeStamp" "Starting: Initializing rosdep"
echo ""
sudo rosdep init
rosdep update
echo ""
echo "$timeStamp" "Finished: Initializing rosdep"

echo "$timeStamp" "Starting: Installing turtlebot packages"
echo ""
sudo apt -y install 'ros-melodic-turtlebot3-*'
echo ""
echo "$timeStamp" "Finished: Installing turtlebot packages"

echo "$timeStamp" "Starting: Installing latest gazebo"
echo ""
sudo sh -c 'echo "deb http://packages.osrfoundation.org/gazebo/ubuntu-stable `lsb_release -cs` main" > /etc/apt/sources.list.d/gazebo-stable.list' > /dev/null 2>&1
wget https://packages.osrfoundation.org/gazebo.key -O - | sudo apt-key add - > /dev/null 2>&1
sudo apt -y update
sudo apt -y upgrade
echo ""
echo "$timeStamp" "Finished: Installing latest gazebo"

echo "$timeStamp" "Starting: Setting up catkin workspace"
echo ""
sudo apt -y install python-catkin-tools
eval path=$path
mkdir -p $path/src
cd $path
catkin init
echo ""
echo "$timeStamp" "Finished:  Setting up catkin workspace"
