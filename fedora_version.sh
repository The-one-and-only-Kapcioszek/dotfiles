#!/bin/sh

cd ..
git clone https://github.com/jonaburg/picom
sudo dnf install feh dmenu rofi polybar kitty bspwm sxhkd ninja-build meson
sudo dnf install libxcb libX11 libX11-devel xcb-util-renderutil xcb-util-renderutil-devel libX11-xcb libXext xcb-util libXdamage libXfixes libXinerama glx-utils pixman dbus libconfig-devel mesa-libGL pcre libev libev-devel uthash-devel cmake 
cd picom
meson --buildtype=release . build
ninja -C build
sudo ninja -C build install
cd ..
cd dotfiles
cp -r .config $HOME
cp -r .local $HOME
cp .fehbg $HOME
sudo chmod +x $HOME/.config/bspwm/bspwmrc
sudo chmod +x $HOME/.config/polybar/launch.sh
