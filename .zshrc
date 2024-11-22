set -o emacs
autoload -U edit-command-line
zle -N edit-command-line
bindkey '^x^e' edit-command-line
bindkey ";5C" forward-word
bindkey ";5D" backward-word
autoload -U select-word-style && select-word-style bash

autoload -Uz vcs_info
precmd() { vcs_info }
zstyle ':vcs_info:git:*' formats '%b '
setopt PROMPT_SUBST
PROMPT='%* %~ ${vcs_info_msg_0_}$ '

zstyle ':completion:*:make:*:targets' call-command true
zstyle ':completion:*:*:make:*' tag-order 'targets'

HISTFILE="$HOME/.zsh_history"
HISTSIZE=10000000
SAVEHIST=10000000
HIST_STAMPS="yyyy-mm-dd"

setopt EXTENDED_HISTORY      # Write the history file in the ':start:elapsed;command' format.
setopt INC_APPEND_HISTORY    # Write to the history file immediately, not when the shell exits.
setopt SHARE_HISTORY         # Share history between all sessions.
setopt HIST_IGNORE_DUPS      # Do not record an event that was just recorded again.
setopt HIST_IGNORE_ALL_DUPS  # Delete an old recorded event if a new event is a duplicate.
setopt HIST_IGNORE_SPACE     # Do not record an event starting with a space.
setopt HIST_SAVE_NO_DUPS     # Do not write a duplicate event to the history file.
setopt HIST_VERIFY           # Do not execute immediately upon history expansion.
setopt APPEND_HISTORY        # append to history file (Default)
setopt HIST_NO_STORE         # Don't store history commands
setopt HIST_REDUCE_BLANKS    # Remove superfluous blanks from each command line being added to the history.

take() { mkdir -p -- "$1" && cd -P -- "$1"; }

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

dw() {
	[ $# -eq 0 ] && URL="$(pbpaste)" || URL="$1"
	YOUTUBE_REGEX='^(https?\:\/\/)?(www\.)?(youtube\.com|youtu\.?be)\/.+$'
	INSTAGRAM_REGEX='(?:(?:http|https):\/\/)?(?:www.)?(?:instagram.com|instagr.am|instagr.com)\/(\w+)'
	TIKTOK_REGEX='^.*https:\/\/(?:m|www|vm)?\.?tiktok\.com\/((?:.*\b(?:(?:usr|v|embed|user|video)\/|\?shareId=|\&item_id=)(\d+))|\w+)'

	if echo "$URL" | grep -qE -e "$YOUTUBE_REGEX" -e "$INSTAGRAM_REGEX" -e "$TIKTOK_REGEX"; then
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

pbfilter() {
	if [ $# -gt 0 ]; then
		pbpaste | "$@" | pbcopy
	fi
}

attach() {
        SESSION_DIR="$HOME/.local/share/"
        SOCKET="session.sock"
        dtach -A "${SESSION_DIR}/${SOCKET}" -z "$SHELL"
}

include() { [[ -f "$1" ]] && source "$1"; }

if [[ $- == *i* ]]; then
	eval "$(fzf --zsh)"
	eval "$(zoxide init zsh)"
	include "${HOME}/.iterm2_shell_integration.zsh"
	include "/opt/homebrew/opt/fzf/shell/completion.zsh"
	include "/opt/homebrew/opt/fzf/shell/key-bindings.zsh"
	include "/opt/homebrew/Library/Taps/homebrew/homebrew-command-not-found/handler.sh"
fi

alias brew-deep-cleanup="brew cleanup --prune=1 -s"
alias dots="/usr/bin/git --git-dir ~/.config/.dotfiles.git --work-tree ~" # https://www.zsh.org/mla/workers/2023/msg00282.html
alias dump_net="scutil -d -v --nwi"
alias gitroot='cd "$(git rev-parse --show-toplevel)"'
alias idocs="cd $HOME/Library/Mobile\ Documents/com~apple~CloudDocs/Documents"
alias jsonform="pbpaste | jq | pbcopy"
alias la="ls -lah"
alias mosh="LANG=en_US.UTF-8 LC_CTYPE=en_US.UTF-8 mosh"
alias rg="rg --hidden"
alias rgai="rga --rga-adapters=+pdfpages,tesseract"
alias ta="tmux a -t"
alias temptake="take $(mktemp -d)"
alias tls="tmux ls"
alias tn="tmux new -t"
alias todo="$VISUAL $HOME/Library/Mobile\ Documents/com~apple~CloudDocs/Documents/todo"
alias updatedb="/usr/libexec/locate.updatedb"
alias watch="watch "
alias zzz="pmset sleepnow"
