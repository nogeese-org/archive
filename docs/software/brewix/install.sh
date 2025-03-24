#!/bin/bash

set -e  # Exit on error

echo "Installing Brewix..."

# Create a dedicated Brewix user if not already present
if ! id "brewix" &>/dev/null; then
    sudo useradd -m -k /dev/null brewix
fi

# Set permissions (global access required)
sudo chmod 777 /home/brewix

# Define paths
BREWIX_ROOT="/home/brewix"
BREWIX_GIT="$BREWIX_ROOT/git"
BREWIX_PKG="$BREWIX_ROOT/pkg"
BREWIX_BIN="$BREWIX_ROOT/bin"

# Clone or update Brewix itself
if [ -d "$BREWIX_ROOT/.git" ]; then
    echo "Updating Brewix..."
    sudo git -C "$BREWIX_ROOT" pull
else
    echo "Downloading Brewix..."
    sudo git clone https://github.com/BrewixHub/brewix "$BREWIX_ROOT"
fi

# Ensure directories exist
sudo mkdir -p "$BREWIX_GIT" "$BREWIX_PKG" "$BREWIX_BIN"

# Set permissions
sudo chmod -R 777 "$BREWIX_ROOT"

# User template setup
mkdir -p "$HOME/.brewix"
cp -r "$BREWIX_ROOT/template/"* "$HOME/.brewix/"

# Add Brewix to PATH
echo -e "\n# Nogeese Brewix Path\nexport PATH=\"\$PATH:$BREWIX_BIN\"" | tee -a ~/.bashrc
echo -e "\nexport BREWIXGIT=\"$BREWIX_GIT\"" | tee -a ~/.bashrc
echo -e "\nexport BREVARPKG=\"$BREWIX_PKG\"" | tee -a ~/.bashrc
echo -e "\nexport USRWIXGIT=\"\$HOME/.brewix/git\"" | tee -a ~/.bashrc
echo -e "\nexport USRWIXPKG=\"\$HOME/.brewix/pkg\"" | tee -a ~/.bashrc

# Reload shell
source ~/.bashrc

echo "Brewix installation completed! 🎉"
echo "You can now use 'brewix' in your terminal."
