#!/bin/bash

/bin/bash ~/.config/polybar/mybar/launch.sh &
/bin/bash ~/Scripts/wp-change.sh &
picom -b 
xmodmap ~/.Xmodmap
fcitx5 &
dunst &
