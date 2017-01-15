# Raspberry Pi Poweroff Script #

This creates a power off script on a Raspberry Pi and sets it up to run at boot. It allows you to power off your Pi (```sudo poweroff```) at the push of a button on pin 5 (GPIO3). Pushing the button again will cause a wake from the poweroff state, so this will function as a power on/off button. It won't truly cut the power, but a Pi in the poweroff state draws very little current.

## Notes ##
1. The script is written to avoid accidental presses of the button and requires you to hold the button down for 0.5 seconds. A momentary button should be used.
2. You can use a different pin for power off by changing the script, but only pin 5 (GPIO3) will work to wake the Pi back up from the poweroff state. This is built into the Pi.
3. You will need to make setup.sh executable (```sudo chmod 777 setup.sh```) in order to run it.
