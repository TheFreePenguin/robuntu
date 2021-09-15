
echo "Install Roblox (this only works on Ubuntu-based distros) ? [Y/n]"
read START
if [ $START = n ]
then
	exec echo "Aborting..."
else
set -e
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
echo "Step 7: Install Wine-Devel"
sudo apt install -y --install-recommends winehq-devel
clear
echo "Step 8: Install Dependencies"
sudo apt install -y git autoconf curl bison flex python3-pip python3-setuptools python3-wheel python3-dev pkg-config libcairo2-dev gtk-update-icon-cache desktop-file-utils xdg-utils libgirepository1.0-dev gir1.2-gtk-3.0
clear
echo "Step 9: Download Wine Source"
git clone https://github.com/Frogging-Family/wine-tkg-git
clear
echo "Step 10: Change Directory to wine-tkg"
cd wine-tkg-git
clear
echo "Step 11: Download patch"
curl https://raw.githubusercontent.com/e666666/robloxWineBuildGuide/main/roblox-wine-staging-v2.patch --output roblox-wine-staging-v2.patch
echo "Step 12: Apply patch"
git apply roblox-wine-staging-v2.patch
echo "Step 13: Install Patched Wine"
cd wine-tkg-git; ./non-makepkg-build.sh
clear
echo "Step 14: Download Grapejuice"
git clone https://gitlab.com/brinkervii/grapejuice.git
clear
echo "Step 15: Change Directory to Grapejuice"
cd grapejuice
clear
echo "Step 16: Install Grapejuice"
python3 ./install.py
echo "Step 17: Install Vim"
sudo apt install -y vim
clear
echo "Step 18: Add Wine Binary"
# here's how to change the wine binary automatically using python
echo 'from grapejuice_common.features import settings; settings.current_settings.set(settings.k_wine_binary, /usr/local/bin/wine")
settings.current_settings.save()' | python3
fi
