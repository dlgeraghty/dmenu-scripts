# minimalist mpc UI through dmenu -> my "custom alternative" to that program i cant pronounce...ncmpcpp
#
# in a first version, it will only display the controls / info if there is a current song playing :)

showqueue(){
	n_tracks=$(mpc playlist | wc -l);
	selected=$(mpc playlist | dmenu -l $n_tracks -p "results: ${n_tracks}") &&
		lineNumber=$(mpc playlist | grep -n "$selected" | head -n 1 | cut -d: -f1);
		action=$(printf "play\\nremove from queue" | dmenu -p "$selected : $lineNumber") &&
			case "$action" in
				"play") mpc play $lineNumber;;
				"remove from queue") mpc del $lineNumber;;
			esac
}

queue(){
	playlist_action=$(printf "add current song to playlist\\nsee queue" | dmenu -i -l 2 -p "queue actions:") &&
	case "$playlist_action" in
		"add current song to playlist");;
		"see queue") showqueue;;
	esac
}

if [ $(mpc current | wc -l) -gt 0 ]
then
	chosen=$(printf "current info\\nnext\\npause/play\\nprev\\nstop\\nqueue" | dmenu -i -p "mympc:") &&
	case "$chosen" in
		"current info") current=$(echo `mpc -f "%title%"`);notify-send "currently: ${current}";;
		"pause/play") mpc toggle;;
		"queue") queue ;;
		*) mpc "$chosen";;
	esac
else
	chosen=$(printf "show playlists\\nnew playlist" | dmenu -i -p "mympc:")&&
	case "$chosen" in
		"show playlists") playlist=$(echo $(mpc lsplaylists) | xargs -n1 echo | dmenu -i -p "choose playlist to load")&&
			mpc stop; mpc clear;mpc load $playlist > /dev/null;mpc play > /dev/null;;
		"new playlist") name=$( echo "" | dmenu -i -p "enter a name for the new playlist")&&
			mpc stop; mpc clear;mpc save $name ;;
	esac
fi
