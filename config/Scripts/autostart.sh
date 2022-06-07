#!/bin/bash

/bin/bash ~/.config/polybar/mybar/launch.sh &
/bin/bash ~/Scripts/wp-change.sh &
picom -b 
xmodmap ~/.xmodmap
fcitx5 &
dunst &
