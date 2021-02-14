#! /bin/bash
# 2021 Install Script

# update system
touch /var/log/installlog.txt



# clear install log
> /var/log/installlog.txt



# set text color vars
TEXT_RESET='\e[0m'
TEXT_GREEN='\e[0;36m'
TEXT_RED_B='\e[1;31m'

echo "Time to make our selves at home! Setup script 2021!" | tee >>/var/log/installlog.txt


if [[ $EUID -ne 0 ]]; then
   	echo "This script must be run as root type: sudo ./newinstall.sh" 
   	exit 1
else


echo "Let's get this OS up to date!"  | tee >>/var/log/installlog.txt


# check for available updates
sudo apt-get update -y
echo -e $TEXT_GREEN
echo 'APT update finished...'  | tee >>/var/log/installlog.txt
echo -e $TEXT_RESET

sudo apt-get dist-upgrade -y
echo -e $TEXT_GREEN
echo 'Distro upgrade finished...'  | tee >>/var/log/installlog.txt
echo -e $TEXT_RESET

sudo apt-get upgrade -y
echo -e $TEXT_GREEN
echo 'APT upgrade finished...'  | tee >>/var/log/installlog.txt
echo -e $TEXT_RESET

sudo apt-get autoremove
echo -e $TEXT_GREEN
echo 'APT auto remove finished...' tee >>/var/log/installlog.txt
echo -e $TEXT_RESET

# install chrome
echo -e $TEXT_GREEN
echo 'Installing Google Chrome' tee >>/var/log/installlog.txt
echo -e $TEXT_RESET
wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | sudo apt-key add -
echo 'deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main' | sudo tee /etc/apt/sources.list.d/google-chrome.list
sudo apt-get update 
sudo apt-get install google-chrome-stable

# install ice for notion
echo -e $TEXT_GREEN
echo 'Installing ICE for NOTION' tee >>/var/log/installlog.txt
echo -e $TEXT_RESET
wget https://launchpad.net/~peppermintos/+archive/ubuntu/ice-dev/+files/ice_5.3.0_all.deb
sudo apt install ./ice_5.3.0_all.deb
rm ./ice_5.3.0_all.deb

# install git
echo -e $TEXT_GREEN
echo 'Installing Git' tee >>/var/log/installlog.txt
echo -e $TEXT_RESET
sudo apt install git -y 

# install gedit
echo -e $TEXT_GREEN
echo 'Installing Gedit' tee >>/var/log/installlog.txt
echo -e $TEXT_RESET
sudo apt install gedit -y 

# install wireshark
echo -e $TEXT_GREEN
echo 'Installing Wireshark' tee >>/var/log/installlog.txt
echo -e $TEXT_RESET
sudo apt install wireshark -y

# install nmap
echo -e $TEXT_GREEN
echo 'Installing nMap' tee >>/var/log/installlog.txt
echo -e $TEXT_RESET
sudo apt install nmap -y

# install gnome tweaks
echo -e $TEXT_GREEN
echo 'Installing gnome tweaks' tee >>/var/log/installlog.txt
echo -e $TEXT_RESET
sudo apt install gnome-tweaks -y


# install slack
echo -e $TEXT_GREEN
echo 'Installing slack' tee >>/var/log/installlog.txt
echo -e $TEXT_RESET
snap install slack --classic

# install discord
echo -e $TEXT_GREEN
echo 'Installing Discord' tee >>/var/log/installlog.txt
echo -e $TEXT_RESET
sudo snap install discord
 
 
# install atom
echo -e $TEXT_GREEN
echo 'Installing Atom' tee >>/var/log/installlog.txt
echo -e $TEXT_RESET
sudo snap install atom --classic

# install filezilla
echo -e $TEXT_GREEN
echo 'Installing Filezilla' tee >>/var/log/installlog.txt
echo -e $TEXT_RESET
sudo snap install filezilla --beta

# install spotify
echo -e $TEXT_GREEN
echo 'Installing Spotify' tee >>/var/log/installlog.txt
echo -e $TEXT_RESET
sudo snap install spotify

# install gnome extensions
echo -e $TEXT_GREEN
echo 'Installing gnome shell'  | tee >>/var/log/installlog.txt
echo -e $TEXT_RESET
sudo apt install chrome-gnome-shell -y

# install codecs and VLC
echo -e $TEXT_GREEN
echo 'Installing video addons (VLC and Codecs)'  | tee >>/var/log/installlog.txt
echo -e $TEXT_RESET
sudo apt install openjdk-11-jre unrar rar p7zip-full ubuntu-restricted-extras libdvd-pkg -y
sudo dpkg-reconfigure libdvd-pkg

 
# Check for reboot required
if [ -f /var/run/reboot-required ]; then
    echo -e $TEXT_RED_B
    echo 'All Applications Installed and the System Is Up To Date!'
    echo 'Reboot required!, Rebooting in 1 minute'  | tee >>/var/log/installlog.txt
    sudo shutdown -r 1
    echo -e $TEXT_RESET
fi
 echo 'All Applications Installed and the System Is Up To Date!'

fi

#To Do: 
# Config ICE for Notion
# https://www.linuxuprising.com/2020/04/top-things-to-do-after-installing.html
# add . to path
# add time stamps to command history in ~/.bashrc - HISTTIMEFORMAT="%F %T "
# figure out how to do a stored command to log
# add menu






