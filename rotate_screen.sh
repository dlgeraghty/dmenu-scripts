# Helper script to rotate my thinkpad X220T touch screen :)
# I dont know if I am going to put it in dmenu as the laptop has a little button which I think I am going to bind the script to but anyway

xrandout="$(xrandr | grep current)"
echo $xrandout

case "$xrandout" in
	*"1366 x 768"* ) xrandr -o left &&
		xinput set-prop "Wacom ISDv4 E6 Finger" --type=float "Coordinate Transformation Matrix" 0 -1 1 1 0 0 0 0 1 &&
		xinput set-prop "Wacom ISDv4 E6 Pen Pen (0)" --type=float "Coordinate Transformation Matrix" 0 -1 1 1 0 0 0 0 1 &&
		xinput set-prop "TPPS/2 IBM TrackPoint" --type=float "Coordinate Transformation Matrix" 0 -1 1 1 0 0 0 0 1 && ~/.config/polybar/launch.sh;;
	*"768 x 1366"* )  xrandr -o normal &&
		xinput set-prop "Wacom ISDv4 E6 Finger" --type=float "Coordinate Transformation Matrix" 0 0 0 0 0 0 0 0 0 &&
		xinput set-prop "Wacom ISDv4 E6 Pen Pen (0)" --type=float "Coordinate Transformation Matrix" 0 0 0 0 0 0 0 0 0 &&
		xinput set-prop "TPPS/2 IBM TrackPoint" --type=float "Coordinate Transformation Matrix" 0 0 0 0 0 0 0 0 0 && ~/.config/polybar/launch.sh;;

esac
