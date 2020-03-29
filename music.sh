# minimalist mpc UI through dmenu -> my "custom alternative" to that program i cant pronounce...ncmpcpp
#
# in a first version, it will only display the controls / info if there is a current song playing :)

if [ $(mpc current | wc -l) -gt 0 ]
then
	chosen=$(printf "current info\\nnext\\npause/play\\nprev\\nstop" | dmenu -i -p "mympc:") &&
	case "$chosen" in
		"current info") current=$(echo `mpc -f "%title%"`);notify-send "currently: ${current}";;
		"pause/play") mpc toggle;;
		*) mpc "$chosen";;
	esac
else
	chosen=$(printf "show playlists" | dmenu -i -p "mympc:")&&
	case "$chosen" in
		"show playlists") playlist=$(echo $(mpc lsplaylists) | dmenu -i -p "choose playlist to load")&&
			mpc load $playlist > /dev/null;mpc play > /dev/null;
	esac
fi
