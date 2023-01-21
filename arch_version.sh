#!/bin/sh

git clone https://github.com/theKapcioszek/dotfiles
git clone https://github.com/jonaburg/picom
sudo pacman -S feh dmenu rofi polybar kitty bspwm sxhkd ninja meson
sudo pacman -S libev uthash libconfig pcre libx11 libxext libxcb pixman dbus
cd picom
meson --buildtype=release . build
ninja -C build
ninja -C build install
cd ..
cd dotfiles
cp -r .config $HOME
cp -r .local $HOME
cp .fehbg $HOME
