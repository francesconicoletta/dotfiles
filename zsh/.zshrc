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

autoload -Uz compinit
compinit

setopt SHARE_HISTORY
HISTFILE=$HOME/.zsh_history
HISTSIZE=1000000
SAVEHIST=1000000

[ -f /usr/share/fzf/shell/key-bindings.zsh ] && source /usr/share/fzf/shell/key-bindings.zsh
[ -f /opt/homebrew/opt/fzf/shell/key-bindings.zsh ] && source /opt/homebrew/opt/fzf/shell/key-bindings.zsh
[[ $- == *i* ]] && [ -f /opt/homebrew/opt/fzf/shell/completion.zsh ] && source /opt/homebrew/opt/fzf/shell/completion.zsh 2> /dev/null
[ -f "${HOME}/.iterm2_shell_integration.zsh" ] && source "${HOME}/.iterm2_shell_integration.zsh"

take()
{
	mkdir -p -- "$1" && cd -P -- "$1"
}

resizeterm()
{
	readonly height=${1:?"Height not specified"}
	readonly width=${2:?"Width not specified"}

	printf "\e[8;${width};${height}t"
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
alias pip="pip3"
alias docker="podman"
alias todo="$VISUAL $HOME/Documents/todo"
alias ta="tmux a -t"
alias tls="tmux ls"
alias tn="tmux new -t"
alias zephyr="source $HOME/Projects/zephyrproject/.venv/bin/activate"
alias rgai="rga --rga-adapters=+pdfpages,tesseract"
alias watch="watch "

case "$OSTYPE" in
	darwin*)
	alias o="open"
	alias abrew="arch -x86_64 /usr/local/Homebrew/bin/brew"
	;;
	linux*)
	alias o="xdg-open"
	alias trash="gio trash"
	alias mpv="gnome-session-inhibit mpv"
	alias webcam="gnome-session-inhibit mpv av://v4l2:/dev/video0 --profile=low-latency --untimed --geometry=30%"
	alias zzz="systemctl suspend"
	;;
esac

MODSEM="Documents/unito/magistrale/y1s1/MODSEM\ -\ Modellazione\ Concettuale\ per\ il\ Web\ Semantico"
AAUT="Documents/unito/magistrale/y1s1/AAUT\ -\ Apprendimento\ Automatico"
MCAD="Documents/unito/magistrale/y1s1/MCAD\ -\ Modelli\ Concorrenti\ e\ Algoritmi\ Distribuiti"
RNDL="Documents/unito/magistrale/y1s1/RNDL\ -\ Reti\ Neurali\ e\ Deep\ Learning"

alias modsem="cd $MODSEM"
alias aaut="cd $AAUT"
alias mcad="cd $MCAD"
alias rndl="cd $RNDL"

alias modsemn="resizeterm 85 45 && $VISUAL $MODSEM/notes"
alias aautn="resizeterm 85 45 && $VISUAL $AAUT/notes"
alias mcadn="resizeterm 85 45 && $VISUAL $MCAD/notes"
alias rndln="resizeterm 85 45 && $VISUAL $RNDL/notes"
