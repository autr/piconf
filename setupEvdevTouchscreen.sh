##############################################
## DO NOT USE "LCD-show" to install drivers ##
##############################################

echo '-----------------------------------------'
echo 'installing evdev to replace libinput...'
echo '-----------------------------------------'
sudo apt-get install xserver-xorg-input-evdev
sudo mv /usr/share/X11/xorg.conf.d/10-evdev.conf /usr/share/X11/xorg.conf.d/45-evdev.conf

echo '-----------------------------------------'
echo 'installing xinput-calibrator (run after reboot)...'
echo '-----------------------------------------'
sudo apt install xinput-calibrator
dpkg -L xinput-calibrator

echo '-----------------------------------------'
echo 'complete! Further steps todo on reboot:'
echo "-> rotate touches @ DISPLAY=:0 xinput set-prop 'ADS7846 Touchscreen' 'Coordinate Transformation Matrix' 0 -1 1 1 0 0 0 0 1"
echo '-> calibrate touches @ xinput-calibrator'
echo '-> view logs @ cat /var/log/Xorg.1.log'
echo '-> view configs @ cd /usr/share/X11/xorg.conf.d'
echo '-----------------------------------------'

##############################################
## DEBUG X11 with:                          ##
## cat /var/log/Xorg.1.log                  ##
## cat ~/.local/share/xorg/Xorg.0.log       ##
##############################################
