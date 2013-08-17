# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Linux console colors (jwr dark)
if [ "$TERM" = "linux" ]; then
   echo -en "\e]P0000000" #black
   echo -en "\e]P83d3d3d" #darkgrey
   echo -en "\e]P18c4665" #darkred
   echo -en "\e]P9bf4d80" #red
   echo -en "\e]P2287373" #darkgreen
   echo -en "\e]PA53a6a6" #green
   echo -en "\e]P37c7c99" #brown
   echo -en "\e]PB9e9ecb" #yellow
   echo -en "\e]P4395573" #darkblue
   echo -en "\e]PC477ab3" #blue
   echo -en "\e]P55e468c" #darkmagenta
   echo -en "\e]PD7e62b3" #magenta
   echo -en "\e]P631658c" #darkcyan
   echo -en "\e]PE6096bf" #cyan
   echo -en "\e]P7899ca1" #lightgrey
   echo -en "\e]PFc0c0c0" #white
   clear # bring us back to default input colours
fi


export PATH=/home/lelio/perl5/bin:/home/lelio/bin:/usr/local/bin:/usr/bin:/bin:/usr/local/sbin:/usr/sbin:/sbin:/usr/bin/vendor_perl:/usr/bin/core_perl
export EDITOR="vim"
export PYTHONPATH=~/ets/
# If a line starts with a space, don't save it
setopt HIST_IGNORE_SPACE
# If I type cd and then cd again, only save the last one
setopt HIST_IGNORE_DUPS


# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="steeef"

# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
alias svim="sudo vim"
alias ll="ls -hl"
alias e="emacsclient -t"
alias r="ranger"
alias R="R --silent --no-save"
alias office2pdf="libreoffice --headless --invisible --convert-to pdf"
alias syu='sudo pacmatic -Syu'
alias S='sudo pacmatic -S'
alias rsn='sudo pacmatic -Rsn'
alias y='yaourt'
alias aur='yaourt -Syua'
alias devel='yaourt -Syua --devel'
# suggested from gitimmersion.com/lab_11.html
#alias gs='git status --ignore-submodules=all'
alias gs='git status'
alias ga='git add '
alias gb='git branch '
alias gc='git commit'
alias gd='git diff'
alias go='git checkout '
alias gk='gitk --all&'

# Adopting Majo's aliases
alias wifiunblock='sudo rfkill unblock all'
alias wifiblock='sudo rfkill block all'
alias wifi='sudo wifi-menu'

# via /etc/sudoers, lelio is permitted to shutdown without root password,
# so make some aliases
alias reboot="sudo reboot"
alias poweroff="sudo poweroff"
alias halt="sudo halt"

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Comment this out to disable weekly auto-update checks
DISABLE_AUTO_UPDATE="true"
setopt nocorrectall
eval `dircolors ~/.dircolors-solarized/dircolors.256dark`

# this must stay commented, because ranger would not display correctly
#export TERM=rxvt-unicode-256color # for a colorful rxvt unicode session

# Uncomment following line if you want red dots to be displayed while waiting for completion
 COMPLETION_WAITING_DOTS="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(vi-mode git archlinux)
source $ZSH/oh-my-zsh.sh
ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets cursor root)

# vi-mode is conservatively emulating vi, to emulate vim's
# 'backspace'=start option, these modifications are needed:
# found here: http://www.zsh.org/mla/users/2009/msg00811.html
#bindkey "^W" backward-kill-word    # vi-backward-kill-word
#bindkey "^H" backward-delete-char  # vi-backward-delete-char
#bindkey "^U" backward-kill-line    # vi-kill-line
## Another approach:
#You can be a bit smarter by replacing the widgets themselves,
#which means you don't need to worry about what they're bound to them.
zle -A .backward-kill-word vi-backward-kill-word
zle -A .backward-delete-char vi-backward-delete-char
zle -A .backward-kill-line vi-backward-kill-line

# add plugin for interactive syntax highlighting
source ~/.zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

fortune cs
