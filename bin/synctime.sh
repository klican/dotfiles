#!/bin/bash

/etc/rc.d/hwclock stop;
ntpd -qg; sleep 10;
pkill ntpd*;
hwclock --systohc; sleep 5;
/etc/rc.d/hwclock start;

