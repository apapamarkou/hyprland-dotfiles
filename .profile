export DISTRO_NAME="YoUNiX"
export PATH="$HOME/.local/bin:$PATH"

export EDITOR=micro
export TERMINAL=kitty
export SHELL_GREETING=fetch

export NNN_OPTS="adeHx"
export NNN_COLORS="2345"
export NNN_PLUG=f:open
export NNN_FIFO=/tmp/nnn.fifo

export QT_QPA_PLATFORMTHEME=gtk3
export QT_FONT_DPI=96
export QT_QPA_FONTDIR=/usr/share/fonts
export QT_ICON_THEME=Breeze-Dark

export GDK_BACKEND=wayland
export QT_QPA_PLATFORM=wayland

# nvim binaries
export PATH="$HOME/.local/share/nvim/mason/bin:$PATH"

# Nice man pages with colors
export MANPAGER="less -R"
export LESS_TERMCAP_mb=$'\e[1;31m'
export LESS_TERMCAP_md=$'\e[1;36m'
export LESS_TERMCAP_me=$'\e[0m'
export LESS_TERMCAP_se=$'\e[0m'
export LESS_TERMCAP_so=$'\e[1;44;33m'
export LESS_TERMCAP_ue=$'\e[0m'
export LESS_TERMCAP_us=$'\e[1;32m'
