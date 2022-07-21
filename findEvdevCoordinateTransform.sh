
echo '-----------------------------------------'

device=$(DISPLAY=:0 xinput_calibrator --list)
device=$(sed -n 's/.*Device\s\"\(.*\)\".*/\1/p' <<< $device)

D=:0

echo "configuring device:" $device
echo '-----------------------------------------'

DISPLAY=$D xinput set-prop "$device" 'Coordinate Transformation Matrix' 1 0 0 0 1 0 0 0 1

out=$(DISPLAY=$D xinput_calibrator)

echo "received output:" $out
echo '-----------------------------------------'

device_name=$(sed -n 's/.*MatchProduct\"\s\"\([0-9]*\).*/\1/p' <<< $out)

echo "using matrix from:" $device_name
echo '-----------------------------------------'

wtot=$(sed -n 's/.*max_x=\([0-9]*\).*/\1/p' <<< $out)
htot=$(sed -n 's/.*max_y=\([0-9]*\).*/\1/p' <<< $out)

minx=$(sed -n 's/.*MinX\"\s\"\([0-9]*\).*/\1/p' <<< $out)
maxx=$(sed -n 's/.*MaxX\"\s\"\([0-9]*\).*/\1/p' <<< $out)
miny=$(sed -n 's/.*MinY\"\s\"\([0-9]*\).*/\1/p' <<< $out)
maxy=$(sed -n 's/.*MaxY\"\s\"\([0-9]*\).*/\1/p' <<< $out)

wtouch=$(bc <<< "$maxx - $minx")
htouch=$(bc <<< "$maxy - $miny")

c0=$(bc -l <<< "$wtot / $wtouch")
c1=$(bc -l <<< "-$minx / $wtouch")
c2=$(bc -l <<< "$htot / $htouch")
c3=$(bc -l <<< "-$miny / $htouch")

tf_matrix="$c0 0 $c1 0 $c2 $c3 0 0 1"

#alter the setting for now
DISPLAY=$D xinput set-prop "$device" 'Coordinate Transformation Matrix' $tf_matrix

echo "setting matrix to:" $tf_matrix
echo '-----------------------------------------'

echo "to make this permanent, save the following content under '/etc/X11/xorg.conf.d/98-screen-calibration.conf' or '/usr/share/X11/xorg.conf.d/98-screen-calibration.conf'"
echo "Section \"InputClass\""
echo "	Identifier \"calibration\""
echo "	MatchProduct \"$device\""
echo "	Option \"TransformationMatrix\" \"$tf_matrix\""
echo "EndSection"
echo '-----------------------------------------'