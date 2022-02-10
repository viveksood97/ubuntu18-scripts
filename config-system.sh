NC='\033[0m'
LG='\033[1;32m'
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
CYAN='\033[1;34m'
LP='\033[1;35m'
timeStamp="${CYAN}[ $(date "+%D %T") ]${NC}"
echo "$timeStamp" "${LG}Configuring Kernel and GPU${NC}"
echo ""
echo "$timeStamp" "${YELLOW}Starting:${NC} Update and Upgrade"
sudo apt -qq -y update && sudo apt -qq -y upgrade
echo "$timeStamp" "${GREEN}Finished:${NC} Update and Upgrade"
echo "$timeStamp" "${LP}Fetching:${NC} Kernel 5.11"
wget -q https://kernel.ubuntu.com/~kernel-ppa/mainline/v5.11/amd64/linux-headers-5.11.0-051100_5.11.0-051100.202102142330_all.deb
wget -q https://kernel.ubuntu.com/~kernel-ppa/mainline/v5.11/amd64/linux-headers-5.11.0-051100-generic_5.11.0-051100.202102142330_amd64.deb
wget -q https://kernel.ubuntu.com/~kernel-ppa/mainline/v5.11/amd64/linux-image-unsigned-5.11.0-051100-generic_5.11.0-051100.202102142330_amd64.deb
wget -q https://kernel.ubuntu.com/~kernel-ppa/mainline/v5.11/amd64/linux-modules-5.11.0-051100-generic_5.11.0-051100.202102142330_amd64.deb
echo "$timeStamp" "${YELLOW}Starting:${NC} Upgrading Kernel to 5.11"
sudo dpkg -i  *.deb > /dev/null 2>&1
echo "$timeStamp" "${GREEN}Current Kernel Version:${NC}" "${LG}$(uname -r)${NC}"
echo "$timeStamp" "${GREEN}Finished:${NC} Upgrading Kernel to 5.11"

echo "$timeStamp" "${LP}Adding:${NC} GPU driver repo"
 yes "" | sudo add-apt-repository ppa:graphics-drivers > /dev/null 2>&1
echo "$timeStamp" "${GREEN}Finished:${NC} GPU driver repo"

echo "$timeStamp" "${YELLOW}Starting:${NC} Update"
sudo apt-get -qq -y update
echo "$timeStamp" "${GREEN}Finished:${NC} Update"

echo "$timeStamp" "${YELLOW}Starting:${NC} Installing nvidia driver 510"
sudo apt-get -qq -y install nvidia-driver-510
echo "$timeStamp" "${GREEN}Finished:${NC} Installing nvidia driver 510"

echo "$timeStamp" "${RED}PLEASE RESTART FOR GPU DRIVER TO RELOAD${NC}"


