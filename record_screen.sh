xrandr --newmode "1920x1080_30.00"   79.75  1920 1976 2168 2416  1080 1083 1088 1102 -hsync +vsync
xrandr --addmode LVDS-1 "1920x1080_30.00"
xrandr --output LVDS-1 --mode "1920x1080_30.00"
i3-msg restart
setbg ~/Downloads/bg.jpg
ffmpeg -f x11grab -video_size 1920x1080 -framerate 30 -i $DISPLAY -f alsa -i default -c:v libx264 -preset ultrafast -c:a aac $1
