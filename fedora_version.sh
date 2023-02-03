#!/bin/sh

cd ..
git clone https://github.com/jonaburg/picom
sudo dnf install feh dmenu rofi polybar kitty bspwm sxhkd ninja-build meson
sudo dnf install libxcb libX11 libX11-devel xcb-util-renderutil xcb-util-image xcb-util-image-devel xcb-util-renderutil-devel libX11-xcb libXext libXext-devel xcb-util libXdamage libXfixes libXinerama glx-utils pixman pixman-devel dbus dbus-devel libconfig-devel mesa-libGL mesa-libGL-devel pcre pcre-devel libev libev-devel uthash-devel cmake 
cd picom
meson --buildtype=release . build
ninja -C build
sudo ninja -C build install
cd ..
cd dotfiles
cp -r .config $HOME
cp -r .local $HOME
cp .fehbg $HOME
echo "Choose theme (1 = road, 2 = adventure time) > "
read theme
if [theme -eq 2]
then
    cp at-theme/config $HOME/.config/polybar
    cp at-theme/kitty.conf $HOME/.config/kitty
    cp at-theme/bspwmrc $HOME/.config/bspwm
fi 
sudo chmod +x $HOME/.config/bspwm/bspwmrc
sudo chmod +x $HOME/.config/polybar/launch.sh
