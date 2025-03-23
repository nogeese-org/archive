echo "Welcome to InfoKit installer!"
echo "If you wan't to cancel the installation, press Ctrl+C now."
echo "Otherwise wait 10 seconds"
sleep 10
echo "Please wait..."
sleep 1
echo "Installing core scripts..."
sudo curl -sSL https://raw.githubusercontent.com/leon8326-nogeese/InfoKit/main/bin/infokit-softwaremanager >> /usr/bin/infokit-softwaremanager
sudo chmod +x /usr/bin/infokit-softwaremanager
echo "Installing software: infostack"
sleep 2
curl -sSL https://raw.githubusercontent.com/leon8326-nogeese/InfoKit/main/installer/infostack-syswideinstall.sh | sudo bash
