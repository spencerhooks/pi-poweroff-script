#!/bin/bash

# This setup script creates a bash script called powerswitch.sh that is
# setup to run at boot and trigger a poweroff command when a button
# on GPIO3 is pressed and held for 0.5 seconds.
#
# Using GPIO3 because this pin also triggers a restart to wake the
# Pi from a halt state when shorted to ground (button pressed).

echo '#!/bin/bash

# This is the GPIO pin connected to the power/restart switch. The
# other pin on the switch should be connected to ground.
GPIOpin=3

echo "$GPIOpin" > /sys/class/gpio/export
echo "in" > /sys/class/gpio/gpio$GPIOpin/direction

while [ 1 = 1 ]; do

  power=$(cat /sys/class/gpio/gpio$GPIOpin/value)
  if [ $power = 0 ]; then
    sleep 0.5
    power=$(cat /sys/class/gpio/gpio$GPIOpin/value)
    if [ $power = 0 ]; then
      sudo poweroff
    fi
  else
    sleep 1
  fi

done' > /etc/powerswitch.sh
sudo chmod 777 /etc/powerswitch.sh
sudo sed -i '$ i /etc/powerswitch.sh &' /etc/rc.local
