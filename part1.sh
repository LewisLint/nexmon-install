#!/bin/zsh
sudo apt update && sudo apt full-upgrade -y

# Install essential compilation dependencies
sudo apt install -y raspberrypi-kernel-headers git libgmp3-dev gawk qpdf bison flex make autoconf libtool texinfo

# REBOOT IS MANDATORY HERE TO SECURE THE KERNEL VERSION MATCH
sudo reboot
