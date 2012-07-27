#!/bin/bash
#xrdb -merge ~/.Xresources
#exec ck-launch-session startkde
#exec openbox-session

# The following variable defines the session which is started if the user doesn't explicitly select a session
# Source: http://svn.berlios.de/svnroot/repos/slim/trunk/xinitrc.sample

#DEFAULT_SESSION=ck-launch-session openbox-session
#
#
#case $1 in
#kde)
#	exec ck-launch-session startkde
#	;;
#*)
#	exec $DEFAULT_SESSION
#	;;
#esac

# D-bus
if which dbus-launch >/dev/null 2>&1 && test -z "$DBUS_SESSION_BUS_ADDRESS"; then
       eval `dbus-launch --sh-syntax --exit-with-session`
fi

xrdb ~/.Xdefaults &
udiskie &
xbacklight -set 25 &
urxvtd -q -f -o &
#wicd-client &
mpd ~/.mpd/mpd.conf 
(sleep 3 && emacs --daemon) &
dropboxd &
#(sleep 4.5 && pytyle2) &
#(sleep 3 && devmon ) &
#xcompmgr & 
compton &
#nitrogen --restore &
#conky &
#tint2 &
numlockx &
unclutter -grab &
#xsetroot -neutral left_ptr &
trayfreq &
#setxkbmap -option grp:switch,grp:shifts_toggle,grp_led:scroll us,sk,vok_sk &
(sleep 2 && xbindkeys) &
setxkbmap -layout vok_sk -variant basic -option ctrl:nocaps &
xset r rate 200 32 &
#(sleep 1 && fbxkb) &
#clipit &
#gvolwheel &
#orage &
stardict &
#(sleep 2 && libreoffice -quickstart -nologo -nodefault) &
#~/.scripts/xcompmgr COMP &
#volti &
#trayer --align right --edge top --transparent true --height 27 --alpha 120 --tint black --widthtype request --heighttype request --SetDockType true --SetPartialStrut false --expand true & 
#stjerm mod alt key t opacity 65 font profont -fg 66ff11 autohide false height 250 &
#kupfer &
#tilda &
#(sleep 2 && pidgin) &
#(sleep 4 && skype) &
#firefox &

#exec ck-launch-session awesome 
exec awesome 
