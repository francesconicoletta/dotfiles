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

include() { [[ -f "$1" ]] && source "$1" }

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

_webcam()
{
osascript << EOF
tell application "QuickTime Player"
  activate
  set doc to new movie recording
  repeat until doc's natural dimensions is not {0, 0}
      delay 0.5
  end repeat
  set bounds of window 1 to {963, 621, 1415, 875}
end tell
EOF
}

if [[ $- == *i* ]]
then
	include /opt/homebrew/opt/fzf/shell/completion.zsh
	include /opt/homebrew/opt/fzf/shell/key-bindings.zsh
	include /usr/local/opt/fzf/shell/completion.zsh
	include /usr/local/opt/fzf/shell/key-bindings.zsh
	include /usr/local/share/examples/fzf/shell/completion.zsh
	include /usr/local/share/examples/fzf/shell/key-bindings.zsh
	include /usr/share/doc/fzf/examples/completion.zsh
	include /usr/share/doc/fzf/examples/key-bindings.zsh
	include /usr/share/fzf/shell/key-bindings.zsh
fi

alias la="ls -lah"
alias rgai="rga --rga-adapters=+pdfpages,tesseract"
alias ta="tmux a -t"
alias tls="tmux ls"
alias tn="tmux new -t"
alias watch="watch "

case "$OSTYPE" in
	darwin*)
	alias abrew="arch -x86_64 /usr/local/Homebrew/bin/brew"
	alias airport="/System/Library/PrivateFrameworks/Apple80211.framework/Versions/A/Resources/airport"
	alias o="open"
	alias todo="$VISUAL $HOME/Library/Mobile\ Documents/com~apple~CloudDocs/Documents/todo"
	alias uni="cd $HOME/Library/Mobile\ Documents/com~apple~CloudDocs/Documents/unito/magistrale/y1s2/"
	alias idocs="cd $HOME/Library/Mobile\ Documents/com~apple~CloudDocs/Documents"
	alias webcam="_webcam"
	alias zzz="pmset sleepnow"
	;;
	linux*)
	alias mpv="gnome-session-inhibit mpv"
	alias o="xdg-open"
	alias pbcopy="wl-copy"
	alias pbpaste="wl-paste"
	alias todo="$VISUAL $HOME/Documents/todo"
	alias webcam="gnome-session-inhibit mpv av://v4l2:/dev/video0 --profile=low-latency --untimed --geometry=30%"
	alias zzz="systemctl suspend"
	;;
esac
