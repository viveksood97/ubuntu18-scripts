#  ['netspeedsimplified@prateekmedia.extension', 'wintile@nowsci.com', 'impatience@gfxmonk.net', 'netspeed@hedayaty.gmail.com', 'sound-output-device-chooser@kgshank.net', 'gnome-ui-tune@itstime.tech', 'shell-volume-mixer@derhofbauer.at']



timeStamp="[ $(date "+%D %T") ]"
echo "$timeStamp" "Setting up visual preferences and Installing all packages"
echo ""

echo "$timeStamp" "Starting: Update and Upgrade"
sudo apt -qq -y update && sudo apt -qq -y upgrade
echo "$timeStamp" "Finished: Update and Upgrade"

echo "$timeStamp" "Starting: Install gnome-tweaks"
sudo apt -qq -y install gnome-tweak-tool
sudo apt -qq -y install gnome-shell-extensions
echo "$timeStamp" "Finished: Installing gnome-tweaks"

echo "$timeStamp" "Starting: Installing terminator"
sudo apt -qq -y install terminator
echo "$timeStamp" "Finished: Installing terminator"

echo "$timeStamp" "Starting: Installing Vscode"
sudo apt -qq -y install ./code_1.64.1-1644255817_amd64.deb
echo "$timeStamp" "Finished: Installing Vscode"

echo "$timeStamp" "Starting: Installing Cura"
wget https://github.com/Ultimaker/Cura/releases/download/4.13.0/Ultimaker_Cura-4.13.0.AppImage
sudo mv Ultimaker_Cura-4.13.0.AppImage /usr/bin/cura\nsudo chmod +x /usr/bin/cura
echo "$timeStamp" "Finished: Installing Cura"

echo "$timeStamp" "Starting: Installing Brave"
sudo apt -qq -y install apt-transport-https curl
sudo curl -fsSLo /usr/share/keyrings/brave-browser-archive-keyring.gpg https://brave-browser-apt-release.s3.brave.com/brave-browser-archive-keyring.gpg
echo "deb [signed-by=/usr/share/keyrings/brave-browser-archive-keyring.gpg arch=amd64] https://brave-browser-apt-release.s3.brave.com/ stable main"|sudo tee /etc/apt/sources.list.d/brave-browser-release.list
sudo apt -qq -y update
sudo apt -qq -y install brave-browser
echo "$timeStamp" "Finished: Installing brave"


echo "$timeStamp" "Starting: Installing dconf"
sudo apt -qq install dconf-editor -y
echo "$timeStamp" "Finished: Installing dconf"

echo "$timeStamp" "Starting: Moving theme to .themes folder"
sudo cp -r ./Nordic-darker/  ~/.themes/
echo "$timeStamp" "Finished: Moving theme to .themes folder"

echo "$timeStamp" "Starting: Setting Theme Nordic-Darker"
gsettings set org.gnome.desktop.interface gtk-theme 'Nordic-darker'
echo "$timeStamp" "Finished: Settng Theme Nordic-Darker"


echo "$timeStamp" "Starting: Installing Icon pack Numix-Circle"
yes "" | sudo add-apt-repository ppa:numix/ppa > /dev/null 2>&1
sudo apt -qq -y update
sudo apt -qq -y install numix-icon-theme-circle
echo "$timeStamp" "Finished: Installing Icon pack Numix-Circle"

echo "$timeStamp" "Starting: Setting Icon pack Numix-Circle"
gsettings set org.gnome.desktop.interface icon-theme 'Numix-Circle'
echo "$timeStamp" "Finished: Settng Icon pack Numix-Circle"

echo "$timeStamp" "Starting: Setting Dock Background Opacity"
gsettings set org.gnome.shell.extensions.dash-to-dock background-opacity 0.10000000000000001
echo "$timeStamp" "Finished: Setting Dock Background Opacity"

echo "$timeStamp" "Starting: Setting Dock Background Opacity"
gsettings set org.gnome.shell.extensions.dash-to-dock extend-height false
echo "$timeStamp" "Finished: Setting Dock Background Opacity"

echo "$timeStamp" "Starting: Dock Fixed? = False"
gsettings set org.gnome.shell.extensions.dash-to-dock dock-fixed false
echo "$timeStamp" "Finished: Dock Fixed? = False"

echo "$timeStamp" "Starting: Hiding Desktop Icons"
gsettings set org.gnome.desktop.background show-desktop-icons false
echo "$timeStamp" "Finished: Hiding Desktop Icons"

echo "$timeStamp" "Starting: Fixing Right Click"
gsettings set org.gnome.desktop.peripherals.touchpad click-method 'areas'
echo "$timeStamp" "Finished: Fixing Right Click"

