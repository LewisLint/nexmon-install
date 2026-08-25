#!/bin/zsh
git clone https://github.com/seemoo-lab/nexmon.git
cd nexmon

sudo apt update
sudo apt upgrade

sudo apt install raspberrypi-kernel-headers git libgmp3-dev gawk qpdf bison flex make autoconf libtool texinfo

source setup_env.sh
make

cd patches/bcm43430a1/7_45_41_46/nexmon
make
make backup-firmware
sudo make install-firmware
