#!/bin/sh

static=.shm_bak/pentadactyl.bak
link=.pentadactyl
volatile=/dev/shm/pentadactyl-$USER


IFS=
set -efu

cd ~

if [ ! -r $volatile ]; then
	mkdir -m0700 $volatile
fi

if [ "$(readlink $link)" != "$volatile" ]; then
	mv $link $static
	ln -s $volatile $link
fi

if [ -e $link/.unpacked ]; then
	rsync -av --delete --exclude .unpacked ./$link/ ./$static/ >/dev/null 2>&1

else
	rsync -av ./$static/ ./$link/
	touch $link/.unpacked
fi

