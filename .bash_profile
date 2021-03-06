# Set paths
export PATH="$HOME/.cargo/bin:$HOME/.local/bin:$PATH"
export PKG_CONFIG_PATH="$HOME/.local/lib/pkgconfig"

# Application vars
export VISUAL=nvim
export EDITOR=nvim

# Fix netbeans
export _JAVA_AWT_WM_NONREPARENTING=1
export _JAVA_OPTIONS='-Dswing.aatext=TRUE -Dawt.useSystemAAFontSettings=on'

# Configure libraries and applications to use wayland
export QT_QPA_PLATFORM=wayland-egl
export QT_WAYLAND_DISABLE_WINDOWDECORATION=1
export CLUTTER_BACKEND=wayland
export SDL_VIDEODRIVER=wayland
export KITTY_ENABLE_WAYLAND=1
export MOZ_ENABLE_WAYLAND=1
export ECORE_EVAS_ENGINE=wayland_egl
export ELM_ENGINE=wayland_egl
export BEMENU_BACKEND=wayland

# Sway cursor size and style
export XCURSOR_THEME=Adwaita
export XCURSOR_SIZE=16

# Rust libraries debugging vars
export RUST_BACKTRACE=1

# Git ceiling directories
export GIT_CEILING_DIRECTORIES="$HOME/code"

# R libraries path
export R_LIBS_USER="$HOME/.local/share/R_libs"

if [[ -f ~/.bashrc ]]; then
    . ~/.bashrc
fi

# Start ssh-agent
if ! pgrep -u "$USER" ssh-agent > /dev/null; then
    ssh-agent -t 1h > "$XDG_RUNTIME_DIR/ssh-agent.env"
fi
if [[ ! "$SSH_AUTH_SOCK" ]]; then
    source "$XDG_RUNTIME_DIR/ssh-agent.env" >/dev/null
fi

# Start a graphical shell
if [ "$XDG_SESSION_TYPE" = "tty" ] && [ $XDG_VTNR -eq 1 ]; then
    export XDG_SESSION_TYPE=wayland
    export XDG_CURRENT_DESKTOP=sway
    exec sway
else
    # Swap caps lock and escape (needs setuid on loadkeys)
    echo -e 'keycode 1 = Caps_Lock\nkeycode 58 = Escape' | loadkeys -
fi
