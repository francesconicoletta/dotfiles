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

setopt SHARE_HISTORY
HISTFILE=$HOME/.zsh_history
HISTSIZE=1000000
SAVEHIST=1000000

# Fedora
[ -f /usr/share/fzf/shell/key-bindings.zsh ] && source /usr/share/fzf/shell/key-bindings.zsh
# Ubuntu
[ -f /usr/share/doc/fzf/examples/key-bindings.zsh ] && source /usr/share/doc/fzf/examples/key-bindings.zsh
[ -f /usr/share/doc/fzf/examples/completion.zsh ] && source /usr/share/doc/fzf/examples/completion.zsh
# macOS
[ -f /opt/homebrew/opt/fzf/shell/key-bindings.zsh ] && source /opt/homebrew/opt/fzf/shell/key-bindings.zsh
[[ $- == *i* ]] && [ -f /opt/homebrew/opt/fzf/shell/completion.zsh ] && source /opt/homebrew/opt/fzf/shell/completion.zsh 2> /dev/null
test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

take() { mkdir -p -- "$1" && cd -P -- "$1" }

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
alias ta="tmux a -t"
alias tls="tmux ls"
alias tn="tmux new -t"
alias rgai="rga --rga-adapters=+pdfpages,tesseract"
alias watch="watch "
alias vi="nvi"
alias uni="cd $HOME/Library/Mobile\ Documents/com~apple~CloudDocs/Documents/unito/magistrale/y1s2/"

#alias todo="$VISUAL $HOME/Documents/todo"
alias todo="$VISUAL $HOME/Library/Mobile\ Documents/com~apple~CloudDocs/Documents/todo"

case "$OSTYPE" in
	darwin*)
	alias o="open"
	alias abrew="arch -x86_64 /usr/local/Homebrew/bin/brew"
	;;
	linux*)
	alias o="xdg-open"
	alias mpv="gnome-session-inhibit mpv"
	alias webcam="gnome-session-inhibit mpv av://v4l2:/dev/video0 --profile=low-latency --untimed --geometry=30%"
	alias zzz="systemctl suspend"
	;;
esac
