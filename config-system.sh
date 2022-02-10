timeStamp="[ $(date "+%D %T") ]"
echo "$timeStamp" "Configuring Kernel and GPU"
echo ""
echo "$timeStamp" "Starting: Update and Upgrade"
sudo apt -qq -y update && sudo apt -qq -y upgrade
echo "$timeStamp" "Finished: Update and Upgrade"
echo "$timeStamp" "Fetching: Kernel 5.11"
wget -q https://kernel.ubuntu.com/~kernel-ppa/mainline/v5.11/amd64/linux-headers-5.11.0-051100_5.11.0-051100.202102142330_all.deb
wget -q https://kernel.ubuntu.com/~kernel-ppa/mainline/v5.11/amd64/linux-headers-5.11.0-051100-generic_5.11.0-051100.202102142330_amd64.deb
wget -q https://kernel.ubuntu.com/~kernel-ppa/mainline/v5.11/amd64/linux-image-unsigned-5.11.0-051100-generic_5.11.0-051100.202102142330_amd64.deb
wget -q https://kernel.ubuntu.com/~kernel-ppa/mainline/v5.11/amd64/linux-modules-5.11.0-051100-generic_5.11.0-051100.202102142330_amd64.deb
echo "$timeStamp" "Starting: Upgrading Kernel to 5.11"
sudo dpkg -i  *.deb > /dev/null 2>&1
echo "$timeStamp" "Current Kernel Version:" "$(uname -r)"
echo "$timeStamp" "Finished: Upgrading Kernel to 5.11"

echo "$timeStamp" "Adding: GPU driver repo"
 yes "" | sudo add-apt-repository ppa:graphics-drivers > /dev/null 2>&1
echo "$timeStamp" "Finished: GPU driver repo"

echo "$timeStamp" "Starting: Update"
sudo apt-get -qq -y update
echo "$timeStamp" "Finished: Update"

echo "$timeStamp" "Starting: Installing nvidia driver 510"
sudo apt-get -qq -y install nvidia-driver-510
echo "$timeStamp" "Finished: Installing nvidia driver 510"

echo "$timeStamp" "PLEASE RESTART FOR GPU DRIVER TO RELOAD"
