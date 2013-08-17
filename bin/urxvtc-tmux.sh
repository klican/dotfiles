#!/bin/bash
# Force to open only one urxvt terminal, to learn to use tabs in tmux
# rather than to have opened dozen of forgotten standalone terminals

urxvtc -e zsh -c "tmux -q has-session && exec tmux attach-session -d || exec tmux new-session -n $USER -s $USER@$HOSTNAME"
