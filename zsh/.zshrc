set -o emacs
autoload -U edit-command-line
zle -N edit-command-line
bindkey '^x^e' edit-command-line
bindkey ";5C" forward-word
bindkey ";5D" backward-word
autoload -U select-word-style && select-word-style bash

autoload -Uz promptinit
promptinit
prompt redhat

HISTFILE=$HOME/.histfile
HISTSIZE=1000
SAVEHIST=1000

[ -f /usr/share/fzf/shell/key-bindings.zsh ] && source /usr/share/fzf/shell/key-bindings.zsh

take()
{
    mkdir -p -- "$1" &&
      cd -P -- "$1"
}

rf()
{
	RG_PREFIX="rga --files-with-matches"
	local file
	file="$(
		FZF_DEFAULT_COMMAND="$RG_PREFIX '$1'" \
			fzf --sort --preview="[[ ! -z {} ]] && rga --pretty \
				--context 5 {q} {}" \
				--phony -q "$1" \
				--bind "change:reload:$RG_PREFIX {q}" \
				--preview-window="70%:wrap"
	)" &&
	echo "opening $file" &&
	if (( $+commands[xdg-open] )); then
		xdg-open "$file"
	else
		open "$file"
	fi
}

alias la="ls -lah"
alias weather="curl wttr.in"
alias pip="pip3"
alias docker="podman"
alias todo="$EDITOR $HOME/Documents/todo"
alias appunti="$EDITOR $HOME/Documents/appunti"
alias ta="tmux a -t"
alias tls="tmux ls"
alias tn="tmux new -t"
alias orario="cat $HOME/Documents/university/semester2/orario"
alias zephyr="source $HOME/Projects/zephyrproject/.venv/bin/activate"
alias rgai="rga --rga-adapters=+pdfpages,tesseract"

case "$OSTYPE" in
  darwin*)
  alias o="open"
  ;;
  linux*)
  alias o="xdg-open"
  alias trash="gio trash"
  alias mpv="gnome-session-inhibit mpv"
  alias webcam="gnome-session-inhibit mpv av://v4l2:/dev/video0 --profile=low-latency --untimed --geometry=30%"
  ;;
esac
