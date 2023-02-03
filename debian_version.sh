#!/bin/sh

cd ..
git clone https://github.com/jonaburg/picom
sudo apt install feh dmenu rofi polybar kitty bspwm sxhkd ninja meson
sudo apt install libx11-dev libx11-xcb-dev libxext-dev xcb libxcb-damage0-dev libxcb-xfixes0-dev libxcb-shape0-dev libxcb-render-util0-dev libxcb-randr0-dev libxcb-composite0-dev libxcb-image0-dev libxcb-present0-dev libxcb-xinerama0-dev libxcb-glx0-dev libpixman-1-dev libdbus-1-3 libconfig++-dev libgl-dev libpcre++-dev libev-dev uthash-dev
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
fi 
sudo chmod +x $HOME/.config/bspwm/bspwmrc
sudo chmod +x $HOME/.config/polybar/launch.sh
