#!/usr/bin/env bash
cd || exit # so the pwd isnt fucked up

if [[ "$(gsettings get org.gnome.desktop.interface color-scheme)" == *dark* ]]; then
    old=dark
    target=light
else
    old=light
    target=dark
fi

if [[ "$1" == "get" ]]; then
    echo "$old"
    exit
fi

function relink_file {
    unlink "$1/$3"
    ln -s "$1/$2" "$1/$3"
}

function recompile_scss {
    sassc "$1/style.scss" >"$1/style.css"
}

gsettings set org.gnome.desktop.interface color-scheme "prefer-$target" &
sed -i "s/$old.scss/$target.scss/" "$HOME/.config/sway/eww/style/color.scss" &
sed -i "s/$old/$target/" "$HOME/.config/rofi/style/color.rasi" &
relink_file "$HOME/.config/swaylock" config.$target config &
relink_file "$HOME/.config/sway" $target color &
(
    unlink "$HOME/.config/gtk-4.0/gtk.css"
    ln -s "$HOME/.config/gtkcss/4.0/gtk-${target}.css" "$HOME/.config/gtk-4.0/gtk.css"
) &
recompile_scss "$HOME/.config/swaync"
recompile_scss "$HOME/.config/wofi"
recompile_scss "$HOME/.config/gtklock/"

wait
sleep 0.1
eww -c "$HOME/.config/sway/eww/shell/" reload &
swaync-client -rs >/dev/null &
swaymsg reload >/dev/null &
wait
