#!/bin/sh
#
# ~/.xinitrc

source /home/chq-stephenco/.proxyconfigs
#
# Executed by startx (run your window manager from here)

if [ -d /etc/X11/xinit/xinitrc.d ]; then
  for f in /etc/X11/xinit/xinitrc.d/*; do
    [ -x "$f" ] && . "$f"
  done
  unset f
fi

setxkbmap -layout us -option ctrl:nocaps

xset +fp /usr/share/fonts/local
xset fp rehash

picom &

#cairo-compmgr &

xcompmgr &

#sh /home/chq-stephenco/bin/work_monitors.sh &

#urxvtd &

#numlockx &

xbindkeys & 

xrdb ~/.Xresources &

#thunar --daemon &

#tint2 &

#dropboxd &

#mpd &

mopidy &

#systemd --user &

#sh ~/code/shell/paperchanger.sh &

dunst &

#conky -c ~/.conkyrc | while read -r; do xsetroot -name "$REPLY"; done &

sxhkd &

sh ~/.fehbg &

#nm-applet & 
#exec dwm
exec bspwm
#exec i3
#exec /home/stephen/bin/startdwm
#exec awesome
#exec wmii
