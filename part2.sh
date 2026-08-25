#!/bin/zsh
git clone https://github.com/seemoo-lab/nexmon.git
cd nexmon

# --- CRITICAL FIX: Compile/Link Nexmon-required libraries ---
# Check if libisl exists; if not, build it from the included source
if [ ! -f /usr/lib/arm-linux-gnueabihf/libisl.so.10 ]; then
    cd buildtools/isl-0.10 && ./configure && make && sudo make install
    sudo ln -s /usr/local/lib/libisl.so /usr/lib/arm-linux-gnueabihf/libisl.so.10
    cd ../..
fi

# Check if libmpfr exists; if not, build it from the included source
if [ ! -f /usr/lib/arm-linux-gnueabihf/libmpfr.so.4 ]; then
    cd buildtools/mpfr-3.1.4 && autoreconf -f -i && ./configure && make && sudo make install
    sudo ln -s /usr/local/lib/libmpfr.so /usr/lib/arm-linux-gnueabihf/libmpfr.so.4
    cd ../..
fi
# -------------------------------------------------------------

# Setup build environment and global build tools
source setup_env.sh
make

# Move to the specific Pi 3B Wi-Fi chipset folder (bcm43430a1)
cd patches/bcm43430a1/7_45_41_46/nexmon/
make
make backup-firmware
sudo make install-firmware

# --- Install Nexutil Utility ---
cd ../../../../utilities/nexutil/
make && sudo make install
