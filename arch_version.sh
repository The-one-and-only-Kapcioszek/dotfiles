#!/bin/sh

cd ..
git clone https://github.com/jonaburg/picom
sudo pacman -S feh dmenu rofi polybar kitty bspwm sxhkd ninja meson
sudo pacman -S libev uthash libconfig pcre libx11 libxext libxcb pixman dbus
cd picom
meson --buildtype=release . build
ninja -C build
sudo ninja -C build install
cd ..
cd dotfiles
cp -r .config $HOME
cp -r .local $HOME
cp .fehbg $HOME
declare -i x=2
echo "Choose theme (1 = road, 2 = adventure time) > "
read theme
if [$theme -eq $x]
then
    cp at-theme/config $HOME/.config/polybar
    cp at-theme/kitty.conf $HOME/.config/kitty
    cp at-theme/bspwmrc $HOME/.config/bspwm
fi  
sudo chmod +x $HOME/.config/bspwm/bspwmrc
sudo chmod +x $HOME/.config/polybar/launch.sh
