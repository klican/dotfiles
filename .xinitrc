# D-bus
if which dbus-launch >/dev/null 2>&1 && test -z "$DBUS_SESSION_BUS_ADDRESS"; then
       eval `dbus-launch --sh-syntax --exit-with-session`
fi

##Execute at login##
xrdb ~/.Xdefaults &
udiskie &
xbacklight -set 25 &
sudo light 20 &
urxvtd -q -f -o &
mpd ~/.mpd/mpd.conf 
(sleep 3 && emacs --daemon) &
(sleep 10 && dropboxd) &
compton &
numlockx &
unclutter -grab &
#trayfreq &
(sleep 2 && xbindkeys) &
setxkbmap -layout vok_sk -variant basic -option ctrl:nocaps &
xset r rate 200 32 &
stardict -h &
#~/bin/touchpad-toggle.sh &
#twmnd &
#(sleep 4 && skype) &

exec ck-launch-session awesome 
