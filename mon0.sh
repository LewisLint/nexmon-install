#how to turn on monitor mode because  airmon-ng said "fuck you"
sudo ifconfig wlan0 down
sudo iw phy phy0 interface add mon0 type monitor
sudo ifconfig mon0 up
