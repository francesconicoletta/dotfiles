if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

if ! [[ "$PATH" =~ "$HOME/.local/bin:$HOME/bin:" ]]
then
    PATH="$HOME/.local/bin:$HOME/bin:$PATH"
fi
export PATH

if [ -d ~/.bashrc.d ]; then
	for rc in ~/.bashrc.d/*; do
		if [ -f "$rc" ]; then
			. "$rc"
		fi
	done
fi

unset rc
shopt -s histverify
export HISTTIMEFORMAT='%Y%m%dT%H%M%S%Z '

export EDITOR=vi
export PATH=$HOME/.local/bin:$HOME/.local/npm/bin:$PATH
export GOPATH=$HOME/Projects/go
export CONDA_AUTO_ACTIVATE_BASE=false

alias o="xdg-open"
alias la="ls -lah"
alias weather="curl wttr.in"
alias pip="pip3"
alias trash="gio trash"
alias docker="podman"
alias todo="$EDITOR ~/Documents/todo"
alias appunti="$EDITOR ~/Documents/appunti"
alias ta="tmux a -t"
alias tls="tmux ls"
alias tn="tmux new -t"
alias orario="cat $HOME/Documents/university/year3/semester1/orario"
alias play="mpv --no-audio-display"
alias mpv="gnome-session-inhibit mpv"

take()
{
    mkdir -p -- "$1" &&
      cd -P -- "$1"
}
