#  ['netspeedsimplified@prateekmedia.extension', 'wintile@nowsci.com', 'impatience@gfxmonk.net', 'netspeed@hedayaty.gmail.com', 'sound-output-device-chooser@kgshank.net', 'gnome-ui-tune@itstime.tech', 'shell-volume-mixer@derhofbauer.at']


NC='\033[0m'
LG='\033[1;32m'
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
PURPLE='\033[1;35m'
LP='\033[1;35m'
timeStamp="${PURPLE}[ $(date "+%D %T") ]${NC}"
echo "$timeStamp" "${LG}Setting up visual preferences and Installing all packages${NC}"
echo ""

echo "$timeStamp" "${YELLOW}Starting:${NC} Update and Upgrade"
sudo apt -qq -y update && sudo apt -qq -y upgrade
echo "$timeStamp" "${LG}Finished:${NC} Update and Upgrade"

echo "$timeStamp" "${YELLOW}Starting:${NC} Install gnome-tweaks"
sudo apt -qq -y install gnome-tweak-tool
sudo apt -qq -y install gnome-shell-extensions
echo "$timeStamp" "${LG}Finished:${NC} Installing gnome-tweaks"

echo "$timeStamp" "${YELLOW}Starting:${NC} Installing terminator"
sudo apt -qq -y install terminator
echo "$timeStamp" "${LG}Finished:${NC} Installing terminator"

echo "$timeStamp" "${YELLOW}Starting:${NC} Installing Vscode"
sudo apt -qq -y install ./code_1.64.1-1644255817_amd64.deb
echo "$timeStamp" "${LG}Finished:${NC} Installing Vscode"

echo "$timeStamp" "${YELLOW}Starting:${NC} Installing Cura"
wget https://github.com/Ultimaker/Cura/releases/download/4.13.0/Ultimaker_Cura-4.13.0.AppImage
sudo mv Ultimaker_Cura-4.13.0.AppImage /usr/bin/cura\nsudo chmod +x /usr/bin/cura
echo "$timeStamp" "${LG}Finished:${NC} Installing Cura"

echo "$timeStamp" "${YELLOW}Starting:${NC} Installing Brave"
sudo apt -qq -y install apt-transport-https curl
sudo curl -fsSLo /usr/share/keyrings/brave-browser-archive-keyring.gpg https://brave-browser-apt-release.s3.brave.com/brave-browser-archive-keyring.gpg
echo "deb [signed-by=/usr/share/keyrings/brave-browser-archive-keyring.gpg arch=amd64] https://brave-browser-apt-release.s3.brave.com/ stable main"|sudo tee /etc/apt/sources.list.d/brave-browser-release.list
sudo apt -qq -y update
sudo apt -qq -y install brave-browser
echo "$timeStamp" "${LG}Finished:${NC} Installing brave"


echo "$timeStamp" "${YELLOW}Starting:${NC} Installing dconf"
sudo apt -qq install dconf-editor -y
echo "$timeStamp" "${LG}Finished:${NC} Installing dconf"

echo "$timeStamp" "${YELLOW}Starting:${NC} Moving theme to .themes folder"
cp -r ./Nordic-darker  ~/.themes/
echo "$timeStamp" "${LG}Finished:${NC} Moving theme to .themes folder"

echo "$timeStamp" "${YELLOW}Starting:${NC} Setting Theme ${LG}Nordic-Darker${NC}"
gsettings set org.gnome.desktop.interface gtk-theme 'Nordic-darker'
echo "$timeStamp" "${LG}Finished:${NC} Settng Theme ${LG}Nordic-Darker${NC}"


echo "$timeStamp" "${YELLOW}Starting:${NC} Installing Icon pack ${LG}Numix-Circle${NC}"
yes "" | sudo add-apt-repository ppa:numix/ppa > /dev/null 2>&1
sudo apt -qq -y update
sudo apt -qq -y install numix-icon-theme-circle
echo "$timeStamp" "${LG}Finished:${NC} Installing Icon pack ${LG}Numix-Circle${NC}"

echo "$timeStamp" "${YELLOW}Starting:${NC} Setting Icon pack ${LG}Numix-Circle${NC}"
gsettings set org.gnome.desktop.interface icon-theme 'Numix-Circle'
echo "$timeStamp" "${LG}Finished:${NC} Settng Icon pack ${LG}Numix-Circle${NC}"

echo "$timeStamp" "${YELLOW}Starting:${NC} Setting Dock Background Opacity"
gsettings set org.gnome.shell.extensions.dash-to-dock background-opacity 0.10000000000000001
echo "$timeStamp" "${LG}Finished:${NC} Setting Dock Background Opacity"

echo "$timeStamp" "${YELLOW}Starting:${NC} Dock Fixed? = False"
gsettings set org.gnome.shell.extensions.dash-to-dock dock-fixed false
echo "$timeStamp" "${LG}Finished:${NC} Dock Fixed? = False"

echo "$timeStamp" "${YELLOW}Starting:${NC} Hiding Desktop Icons"
gsettings set org.gnome.desktop.background show-desktop-icons false
echo "$timeStamp" "${LG}Finished:${NC} Hiding Desktop Icons"

