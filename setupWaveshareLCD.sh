##############################################
## DO NOT USE "LCD-show" to install drivers ##
##############################################

TYPE=${1:-waveshare32b}

echo '-----------------------------------------'
echo 'installing LCD with type' $TYPE '...'
echo '-----------------------------------------'
set -e
DIR=https://github.com/autr/waveshare-dtoverlays.git
if [ ! -d "waveshare-dtoverlays" ]; then
	echo 'cloning autr/waveshare-dtoverlays...'
	git clone "$DIR"
fi

echo '-----------------------------------------'
echo 'copying dtoverlay to /boot/overlays ...'
echo '-----------------------------------------'
sudo cp waveshare-dtoverlays/$TYPE.dtbo /boot/overlays/

echo '-----------------------------------------'
echo 'installing most recent v4l2loopback driver...'
echo '-----------------------------------------'
wget http://raspbian.raspberrypi.org/raspbian/pool/main/v/v4l2loopback/v4l2loopback-dkms_0.12.5-1_all.deb
sudo apt install ./v4l2loopback-dkms_0.12.5-1_all.deb
rm -rf v4l2loopback-dkms_0.12.5-1_all.deb
dpkg -L v4l2loopback-dkms
dpkg -L v4l2loopback-utils

echo '-----------------------------------------'
echo 'cleaning up folder (remove waveshare-dtoverlays)...'
echo '-----------------------------------------'
rm -rf waveshare-dtoverlays

echo '-----------------------------------------'
echo 'complete! Further steps todo on reboot:'
echo '-> run setupEvdevTouchscreen.sh'
echo '-----------------------------------------'

##############################################
## DEBUG X11 with:                          ##
## cat /var/log/Xorg.1.log                  ##
## cat ~/.local/share/xorg/Xorg.0.log       ##
##############################################
