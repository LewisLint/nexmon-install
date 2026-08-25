#!/bin/zsh
set -e # Exit on errors

# 1. Setup
if [ ! -d "nexmon" ]; then git clone https://github.com/seemoo-lab/nexmon.git; fi
cd nexmon
source setup_env.sh

# 2. Build Tools (Handles missing 32-bit libraries)
cd buildtools/isl-0.10 && ./configure && make && sudo make install && cd ../..
cd buildtools/mpfr-3.1.4 && autoreconf -f -i && ./configure && make && sudo make install && cd ../..

# 3. Compile and Install Firmware (bcm43430a1)
make
cd patches/bcm43430a1/7_45_41_46/nexmon/
make
sudo make install-firmware

# 4. Install nexutil
cd ../../../../../utilities/nexutil/
make
sudo make install
