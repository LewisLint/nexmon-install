#!/bin/zsh
# copy thi file to your .zshrc or .bashrc,  or just put "source .mon0.sh" in your shell config file
#how to turn on monitor mode because  airmon-ng said "fuck you"
monon() {
  # shut off the managed mode card
  sudo ifconfig wlan0 down
  #create a a monitored mode card
  sudo iw phy phy0 interface add mon0 type monitor
  # pull the internet back  up
  sudo ifconfig mon0 up
}

monoff() {
  # 1. Shut down the monitor interface
  sudo ifconfig mon0 down
  
  # 2. Delete the monitor interface completely
  sudo iw dev mon0 del
  
  # 3. Bring your regular Wi-Fi back online
  sudo ifconfig wlan0 up
}
