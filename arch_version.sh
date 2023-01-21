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
sudo chmod +x $HOME/.config/bspwm/bspwmrc
sudo chmod +x $HOME/.config/polybar/launch.sh
