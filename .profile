# Set path
export PATH=$PATH:$HOME/.local/bin

# Configure pinentry to use the correct TTY
#export GPG_TTY=`tty`
#gpg-connect-agent updatestartuptty /bye > /dev/null

# Application vars
export TERMINAL="st"
export VISUAL="nvim"
export EDITOR="nvim"
export PAGER="less"

# Qt5 style
export QT_QPA_PLATFORMTHEME="gtk3"

# Java font AA
export _JAVA_OPTIONS='-Dswing.defaultlaf=com.sun.java.swing.plaf.gtk.GTKLookAndFeel'

# wlc/wlroots keyboard configuration
export XKB_DEFAULT_LAYOUT="us,fi"
export XKB_DEFAULT_OPTIONS="caps:escape,grp:shifts_toggle"

# configure libraries to use wayland
#export QT_QPA_PLATFORM=wayland-egl
#export QT_WAYLAND_DISABLE_WINDOWDECORATION=1
#export CLUTTER_BACKEND=wayland
#export SDL_VIDEODRIVER=wayland

# stop if uninteractive
case $- in
    *i*) ;;
    *) return ;;
esac

export PS1='\[\e[0;32m\]\w\[\e[0m\] \$ '
set -o vi
alias tmc="java -cp ~/.local/share/tmc-cli fi.helsinki.cs.tmc.cli.Application"

if [[ "`tty`" = "/dev/tty1" ]]; then
    exec startx
fi