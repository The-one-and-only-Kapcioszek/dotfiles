#!/bin/sh

cd ..
git clone https://github.com/jonaburg/picom
sudo apt install feh dmenu rofi polybar kitty bspwm sxhkd ninja meson
sudo apt install libx11-dev libx11-xcb-dev libxext-dev xcb libxcb-damage0-dev 
sudo apt install libxcb-xfixes0-dev libxcb-shape0-dev libxcb-render-util0-dev 
sudo apt install libxcb-randr0-dev libxcb-composite0-dev libxcb-image0-dev 
sudo apt install libxcb-present0-dev libxcb-xinerama0-dev libxcb-glx0-dev 
sudo apt install libpixman-1-dev libdbus-1-3 libconfig++-dev libgl-dev 
sudo apt install libpcre++-dev libev-dev uthash-dev
cd picom
meson --buildtype=release . build
ninja -C build
sudo ninja -C build install
cd ..
cd dotfiles
cp -r .config $HOME
cp -r .local $HOME
cp .fehbg $HOME
echo "Choose theme (1 = green color scheme, 2 = adventure time color scheme) > "
read theme
if (($theme==2))
then
    cp at-theme/config $HOME/.config/polybar
    cp at-theme/kitty.conf $HOME/.config/kitty
    cp at-theme/bspwmrc $HOME/.config/bspwm
fi  
sudo chmod +x $HOME/.config/bspwm/bspwmrc
sudo chmod +x $HOME/.config/polybar/launch.sh
