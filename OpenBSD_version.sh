#!/bin/sh


doas pkg_add feh dmenu rofi polybar kitty bspwm sxhkd picom
cp -r .config $HOME
cp -r .local $HOME
cp .fehbg $HOME
echo "Choose theme (1 = road, 2 = adventure time) > "
read theme
if (($theme==2))
then
    cp at-theme/config $HOME/.config/polybar
    cp at-theme/kitty.conf $HOME/.config/kitty
    cp at-theme/bspwmrc $HOME/.config/bspwm
fi  
doas chmod +x $HOME/.config/bspwm/bspwmrc
doas chmod +x $HOME/.config/polybar/launch.sh
