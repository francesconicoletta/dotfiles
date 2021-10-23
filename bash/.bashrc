# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# User specific environment
if ! [[ "$PATH" =~ "$HOME/.local/bin:$HOME/bin:" ]]
then
    PATH="$HOME/.local/bin:$HOME/bin:$PATH"
fi
export PATH

# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=

# User specific aliases and functions
if [ -d ~/.bashrc.d ]; then
	for rc in ~/.bashrc.d/*; do
		if [ -f "$rc" ]; then
			. "$rc"
		fi
	done
fi

unset rc

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
alias ta="tmux a -t"
alias tls="tmux ls"
alias tn="tmux new -t"
alias fedora="toolbox enter --release 34"
alias orario="cat $HOME/Documents/uni/terzoanno/primosemestre/orario"

source /usr/share/fzf/shell/key-bindings.bash
