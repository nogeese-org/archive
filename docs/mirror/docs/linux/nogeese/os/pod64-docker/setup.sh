#!/usr/bin/sudo bash
cd /etc
{
    echo ""
    echo "# Nogeese Repositories"
    echo "[nogeese]"
    echo "Server = https://raw.githubusercontent.com/nogeese-org/mirror/stable/nogeese/os/pod64-docker"
    echo "SigLevel = Optional TrustAll"
} | sudo tee -a pacman.conf
