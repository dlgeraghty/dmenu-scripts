path=~/Downloads/backgrounds &&
cd $path && 
for i in *; do echo $i >> /tmp/bgs; done
chosen=$(cat /tmp/bgs | dmenu -l 3 -p "BG")
feh --bg-scale "$chosen"
rm /tmp/bgs
