#!/bin/sh


cd ..
git clone https://github.com/jonaburg/picom
doas pkg_add feh dmenu rofi polybar kitty bspwm sxhkd ninja meson
#pkg_add libx11-dev libx11-xcb-dev libxext-dev xcb libxcb-damage0-dev libxcb-xfixes0-dev libxcb-shape0-dev libxcb-render-util0-dev libxcb-randr0-dev libxcb-composite0-dev libxcb-image0-dev libxcb-present0-dev libxcb-xinerama0-dev libxcb-glx0-dev libpixman-1-dev libdbus-1-3 libconfig++-dev libgl-dev libpcre++-dev libev-dev uthash-dev
cd picom
meson --buildtype=release . build
ninja -C build
doas ninja -C build install
cd ..
cd dotfiles
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
