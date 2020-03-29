# minimalist mpc UI through dmenu -> my "custom alternative" to that program i cant pronounce...ncmpcpp
#
# in a first version, it will only display the controls / info if there is a current song playing :)

showplaylist(){
	selected=$(mpc playlist | dmenu -l $(mpc playlist | wc -l))&&
		action=$(printf "play\\nremove from playlist" | dmenu -p "$selected");
}

playlist(){
	playlist_action=$(printf "add current song to playlist\\nsee playlist" | dmenu -i -l 2 -p "playlist actions:") &&
	case "$playlist_action" in
		"add current song to playlist");;
		"see playlist") showplaylist;;
	esac
}

if [ $(mpc current | wc -l) -gt 0 ]
then
	chosen=$(printf "current info\\nnext\\npause/play\\nprev\\nstop\\nplaylist" | dmenu -i -p "mympc:") &&
	case "$chosen" in
		"current info") current=$(echo `mpc -f "%title%"`);notify-send "currently: ${current}";;
		"pause/play") mpc toggle;;
		"playlist") playlist ;;
		*) mpc "$chosen";;
	esac
else
	chosen=$(printf "show playlists\\nnew playlist" | dmenu -i -p "mympc:")&&
	case "$chosen" in
		"show playlists") playlist=$(echo $(mpc lsplaylists) | xargs -n1 echo | dmenu -i -p "choose playlist to load")&&
			mpc load $playlist > /dev/null;mpc play > /dev/null;;
		"new playlist") name=$( echo "" | dmenu -i -p "enter a name for the new playlist")&&
			mpc stop; mpc clear;mpc save $name ;;
	esac
fi
