set -o emacs
autoload -U edit-command-line
zle -N edit-command-line
bindkey '^x^e' edit-command-line
bindkey ";5C" forward-word
bindkey ";5D" backward-word
autoload -U select-word-style && select-word-style bash
setopt SHARE_HISTORY

autoload -Uz compinit && compinit
autoload -Uz vcs_info
precmd_vcs_info() { vcs_info }
precmd_functions+=( precmd_vcs_info )
setopt prompt_subst
RPROMPT=\$vcs_info_msg_0_
zstyle ':vcs_info:git:*' formats '%b'

take() { mkdir -p -- "$1" && cd -P -- "$1" }

resizeterm()
{
height=${1:?"Height not specified"}
width=${2:?"Width not specified"}
printf "\e[8;${width};${height}t"
}

trash()
{
if [[ $# ]]; then
	a=()
	for f in "$@"; do a+=("$(realpath "$f")"); done
	f=$(printf "\",POSIX FILE \"%s" "${a[@]}")\"
	osascript -ss -e "tell app \"Finder\" to delete {${f:2}}" 1>/dev/null
fi
}

dw()
{
[ $# -eq 0 ] && URL="$(pbpaste)" || URL="$1"

if echo "$URL" | grep -qE '^(https?\:\/\/)?(www\.)?(youtube\.com|youtu\.?be)\/.+$'; then
	yt-dlp -S vcodec:h264,res,acodec:m4a --add-metadata --embed-subs \
		--embed-thumbnail -o "$HOME/Movies/%(title)s-%(id)s.%(ext)s" "$URL"
else
	aria2c -x 16 -s 16 -k 1M -d "$HOME/Downloads" "$URL"
fi

osascript -ss - "$?" "$URL" <<EOF
on run argv
display notification "Exit code " & item 1 of argv with title item 2 of argv sound name "Blow"
end run
EOF
}

include() { [[ -f "$1" ]] && source "$1" }

if [[ $- == *i* ]]
then
	include /opt/homebrew/opt/fzf/shell/completion.zsh
	include /opt/homebrew/opt/fzf/shell/key-bindings.zsh
fi

alias dod="cd $HOME/.local/share/dotfiles"
alias dump_net="scutil -d -v --nwi"
alias gitroot='cd "$(git rev-parse --show-toplevel)"'
alias idocs="cd $HOME/Library/Mobile\ Documents/com~apple~CloudDocs/Documents"
alias la="ls -lah"
alias rg="rg --hidden"
alias rgai="rga --rga-adapters=+pdfpages,tesseract"
alias ta="tmux a -t"
alias tls="tmux ls"
alias tn="tmux new -t"
alias todo="$VISUAL $HOME/Library/Mobile\ Documents/com~apple~CloudDocs/Documents/todo"
alias uni="cd $HOME/Library/Mobile\ Documents/com~apple~CloudDocs/Documents/unito/magistrale/y1s2/"
alias watch="watch "
alias zzz="pmset sleepnow"
