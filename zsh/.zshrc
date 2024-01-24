set -o emacs
autoload -U edit-command-line
zle -N edit-command-line
bindkey '^x^e' edit-command-line
bindkey ";5C" forward-word
bindkey ";5D" backward-word
autoload -U select-word-style && select-word-style bash

setopt SHARE_HISTORY

take() { mkdir -p -- "$1" && cd -P -- "$1" }

resizeterm() {
	height=${1:?"Height not specified"}
	width=${2:?"Width not specified"}
	printf "\e[8;${width};${height}t"
}

trash() {
	if [[ $# ]]; then
		a=()
		for f in "$@"; do a+=("$(realpath "$f")"); done
		f=$(printf "\",POSIX FILE \"%s" "${a[@]}")\"
		osascript -ss -e "tell app \"Finder\" to delete {${f:2}}" 1>/dev/null
	fi
}

include() { [[ -f "$1" ]] && source "$1" }

if [[ $- == *i* ]]
then
	include /opt/homebrew/opt/fzf/shell/completion.zsh
	include /opt/homebrew/opt/fzf/shell/key-bindings.zsh
fi

alias abrew="arch -x86_64 /usr/local/Homebrew/bin/brew"
alias airport="/System/Library/PrivateFrameworks/Apple80211.framework/Versions/A/Resources/airport"
alias dod="cd $HOME/.local/share/dotfiles"
alias dump_net="scutil -d -v --nwi"
alias idocs="cd $HOME/Library/Mobile\ Documents/com~apple~CloudDocs/Documents"
alias rg="rg --hidden"
alias rgai="rga --rga-adapters=+pdfpages,tesseract"
alias ta="tmux a -t"
alias tls="tmux ls"
alias tn="tmux new -t"
alias todo="$VISUAL $HOME/Library/Mobile\ Documents/com~apple~CloudDocs/Documents/todo"
alias uni="cd $HOME/Library/Mobile\ Documents/com~apple~CloudDocs/Documents/unito/magistrale/y1s1/"
alias watch="watch "
alias zzz="pmset sleepnow"
