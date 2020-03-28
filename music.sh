# minimalist mpc UI through dmenu -> my "custom alternative" to that program i cant pronounce...ncmpcpp
#
# in a first version, it will only display the controls / info if there is a current song playing :)

if [ $(mpc current | wc -l) -gt 0 ]
then
	chosen=$(printf "current info\\nnext\\npause\\nplay\\nprev\\n" | dmenu -i -p "mympc:") &&
	case "$chosen" in
		"current info") $(echo mpc);;
		"next") mpc next;;
		"pause") mpc pause;;
		"play") mpc play;;
		"prev") mpc prev;;
	esac
fi
