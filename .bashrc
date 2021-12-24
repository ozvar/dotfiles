#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias mux='tmuxinator'
PS1='[\u@\h \W]\$ '

# set default editor
export VISUAL=nvim
export EDITOR=nvim
export TERM=rxvt-256color
export PATH="$HOME/.local/bin:$PATH"

# enable powerline in terminal
powerline-daemon -q
POWERLINE_BASH_CONTINUATION=1
POWERLINE_BASH_SELECT=1
. /usr/share/powerline/bindings/bash/powerline.sh

# quit to current directory in ranger using Q
function ranger {
    local IFS=$'\t\n'
    local tempfile="$(mktemp -t tmp.XXXXXX)"
    local ranger_cmd=(
        command
        ranger
        --cmd="map Q chain shell echo %d > "$tempfile"; quitall"
    )
    
    ${ranger_cmd[@]} "$@"
    if [[ -f "$tempfile" ]] && [[ "$(cat -- "$tempfile")" != "$(echo -n `pwd`)" ]]; then
        cd -- "$(cat "$tempfile")" || return
    fi
    command rm -f -- "$tempfile" 2>/dev/null
}

# support for "shims" used by pyenv to enable python version switching
source /usr/share/pyenv/pyenv_user_setup.bash
