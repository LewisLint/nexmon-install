#!/bin/zsh
sudo apt update && sudo apt full-upgrade -y || exit 1

sudo apt install -y \
    raspberrypi-kernel-headers \
    git \
    libgmp3-dev \
    gawk \
    qpdf \
    bison \
    flex \
    make \
    autoconf \
    libtool \
    texinfo || exit 1

echo "Dependencies installed. Rebooting to ensure the kernel/header versions match..."
sudo reboot
