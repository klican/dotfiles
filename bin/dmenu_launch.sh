#!/bin/sh
exec $(dmenu_path | dmenu -b -nb '#E0E9D0' -sb '#a6b38d' -sf '#070806' && eval “exec $exe”)
