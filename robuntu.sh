
echo "Install Roblox (this only works on Ubuntu-based distros) ? [Y/n]"
read START
if [ $START = n ]
	exec echo "Aborting..."
else

echo "Step 1: Add 32-bit support"
sudo dpkg --add-architecture i386
clear
echo "Step 2: Download Wine Key"
wget -nc https://dl.winehq.org/wine-builds/winehq.key
clear
echo "Step 3: Add Wine Key"
sudo apt-key add winehq.key
clear
echo "Step 4: Add Wine Repo"
sudo add-apt-repository 'deb https://dl.winehq.org/wine-builds/ubuntu/ focal main'
clear
echo "Step 5: Updating Repos"
sudo apt update
clear
echo "Step 6: Install Updates" 
sudo apt upgrade -y
clear
echo "Step 7: Install Wine"
sudo apt install --install-recommends winehq-devel
clear
echo "Step 8: Install Dependencies"
sudo apt install -y git python3-pip python3-setuptools python3-wheel python3-dev pkg-config libcairo2-dev gtk-update-icon-cache desktop-file-utils xdg-utils libgirepository1.0-dev gir1.2-gtk-3.0
clear
echo "Step 9: Download Wine (Part 2)"
wget --no-check-certificate "https://onedrive.live.com/download?cid=0D1B2C3D089F7FA0&resid=D1B2C3D089F7FA0%21106&authkey=AAsdS8XcgeXp-_c" -O wine-tkg-staging-fsync-git-6.15.r0.g4b6879f3.tar.xz
clear
echo "Step 10: Extract Wine (Part 2)"
tar -xf wine-tkg-staging-fsync-git-6.15.r0.g4b6879f3.tar.xz
clear
echo "Step 11: Download Grapejuice"
git clone https://gitlab.com/brinkervii/grapejuice.git
clear
echo "Step 12: Change Directory to Grapejuice"
cd grapejuice
clear
echo "Step 13: Install Grapejuice"
python3 ./install.py
echo "Step 14: Install Vim"
sudo apt install vim
clear
echo "Step 15 is manual. You need to put 
/home/username/wine-tkg-staging-fsync-git-6.15.r0.g4b6879f3/bin/wine between the quotes"
vim ~/.config/brinkervii/grapejuice/user_settings.json
