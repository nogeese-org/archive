#!/usr/bin/sudo bash
cd /etc
{
    echo ""
    echo "[bit]"
    echo "Server = https://raw.githubusercontent.com/nogeese-org/mirror/stable/bit/os/pod64-docker"
    echo "SigLevel = Optional TrustAll"
} | sudo tee -a pacman.conf
