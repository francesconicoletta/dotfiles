set -o emacs
autoload -U edit-command-line
zle -N edit-command-line
bindkey '^x^e' edit-command-line
autoload -Uz promptinit
promptinit
prompt redhat

HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000

take()
{
    mkdir -p -- "$1" &&
      cd -P -- "$1"
}

alias la="ls -lah"
alias weather="curl wttr.in"
alias pip="pip3"
alias docker="podman"
alias todo="$EDITOR ~/Documents/todo"
alias appunti="$EDITOR ~/Documents/appunti"
alias ta="tmux a -t"
alias tls="tmux ls"
alias tn="tmux new -t"
alias orario="cat $HOME/Documents/university/semester2/orario"
alias zephyr="source $HOME/Projects/zephyrproject/.venv/bin/activate"

case "$OSTYPE" in
  darwin*)
  alias o="open"
  ;;
  linux*)
  alias o="xdg-open"
  alias trash="gio trash"
  alias play="mpv --no-audio-display"
  alias mpv="gnome-session-inhibit mpv"
  ;;
esac
