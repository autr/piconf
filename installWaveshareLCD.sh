##############################################
## DO NOT USE "LCD-show" to install drivers ##
## its dodgy AF and will make you angery    ##
##############################################

TYPE=${1:-waveshare32b}

echo 'Installing with type' $TYPE '...'

# [1] CLONE GITHUB

set -e
DIR=https://github.com/autr/waveshare-dtoverlays.git
if [ ! -d "waveshare-dtoverlays" ]; then
	echo 'Cloning waveshare drivers...'
	git clone "$DIR"
fi

# [2] COPY DTOVERLAY

echo 'Copying driver to /boot/overlays ...'
sudo cp waveshare-dtoverlays/$TYPE.dtbo /boot/overlays/


# [3] EDIT BOOT CONFIG

echo 'Enabling driver in /boot/config.txt ...'
LINE=${dtoverlay=$TYPE}
FILE='/boot/config.txt'
sudo grep -qF -- "$LINE" "$FILE" || echo "$LINE" >> "$FILE"

# [4] ADD X11 CONFIG

echo 'Adding fbdev for X11 desktop...'
FBDEV='/usr/share/X11/xorg.conf.d/99-fbdev.conf'
sudo truncate -s0 $FBDEV
echo -e '# auto-generated from installWaveshare.sh' | sudo tee -a $FBDEV > /dev/null
echo -e 'Section "Device"' | sudo tee -a $FBDEV > /dev/null
echo -e '\tIdentifier "Waveshare LCD"' | sudo tee -a $FBDEV > /dev/null
echo -e '\tDriver "fbdev"' | sudo tee -a $FBDEV > /dev/null
echo -e '\tOption "fbdev" "/dev/fb1"' | sudo tee -a $FBDEV > /dev/null
echo -e 'EndSection' | sudo tee -a $FBDEV > /dev/null

# [5] INSTALL XINPUT-CALIBRATOR

echo 'Installing xinput-calibrator (run after reboot)...'
sudo apt install xinput-calibrator

# [6] CLEAN UP

echo 'Cleaning up folder (removing waveshare-dtoverlays)...'
rm -rf waveshare-dtoverlays

# [7] MESSAGES

echo '-----------------------------------------'
echo 'Done! Further steps todo on reboot:'
echo "-> rotate touches @ DISPLAY=:0 xinput set-prop 'ADS7846 Touchscreen' 'Coordinate Transformation Matrix' 0 -1 1 1 0 0 0 0 1"
echo '-> calibrate touches @ xinput-calibrator'
echo '-> view logs @ cat /var/log/Xorg.1.log'
echo '-> view configs @ cd /usr/share/X11/xorg.conf.d'
echo '-----------------------------------------'

# VIEW LOGS: cat /var/log/Xorg.1.log
# X11 CONFIGS: cd /usr/share/X11/xorg.conf.d