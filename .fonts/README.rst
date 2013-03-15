INSTALL
=======

Just download and put into your ~/.fonts dir and run ``fc-cache -vf``

If you're using urxvt add something like this to your ~/.Xresources or ~/.Xdefaults::


    URxvt.font:       [codeset=ASCII]xft:Envy Code R for Powerline:size=10,\
                      [codeset=ISO10646]xft:WenQuanYi Micro Hei:regular
    URxvt.boldFont:   [codeset=ASCII]xft:Envy Code R for Powerline:bold:size=10,\
                      [codeset=ISO10646]xft:WenQuanYi Micro Hei:bold
    URxvt.italicFont: [codeset=ASCII]xft:Envy Code R for Powerline:italic:size=10,\
                      [codeset=ISO10646]xft:WenQuanYi Micro Hei:italic

    URxvt.keysym.M-Up: command: \
            \033]710;[codeset=ASCII]xft:Envy Code R for Powerline:size=13, [codeset=ISO10646]xft:WenQuanYi Micro Hei:regular:size=13\007 \
            \033]711;[codeset=ASCII]xft:Envy Code R for Powerline:bold:size=13, [codeset=ISO10646]xft:WenQuanYi Micro Hei:bold:size=13\007 \
            \033]712;[codeset=ASCII]xft:Envy Code R for Powerline:italic:size=13, [codeset=ISO10646]xft:WenQuanYi Micro Hei:italic:size=13\007
    URxvt.keysym.M-Down: command: \
            \033]710;[codeset=ASCII]xft:Envy Code R for Powerline:size=10, [codeset=ISO10646]xft:WenQuanYi Micro Hei:regular\007 \
            \033]711;[codeset=ASCII]xft:Envy Code R for Powerline:bold:size=10, [codeset=ISO10646]xft:WenQuanYi Micro Hei:bold\007 \
            \033]712;[codeset=ASCII]xft:Envy Code R for Powerline:italic:size=10, [codeset=ISO10646]xft:WenQuanYi Micro Hei:italic\007

Make sure to run ``xrdb -merge ~/.Xresources`` afterwards and close all urxvt terminals.