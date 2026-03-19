#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

$SHELL_GREETING

source ~/.local/share/shell/fzf-cdf.bash
source ~/.local/share/shell/aliases
eval "$(starship init bash)"



