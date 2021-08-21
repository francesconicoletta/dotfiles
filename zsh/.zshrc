export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="eastwood"

plugins=(
	git
	sudo
	zsh-syntax-highlighting
	zsh-autosuggestions
	)

source $ZSH/oh-my-zsh.sh

alias o="xdg-open"
alias weather="curl wttr.in"
alias pip="pip3"
alias trash="gio trash"
alias copy="xsel -b <"
alias docker="podman"
alias todo="$EDITOR ~/Documents/todo"
alias dsync="cd ~/.dotfiles && git pull && cd -"
alias temp="cat /sys/class/thermal/thermal_zone*/temp"
alias t="tmux"
alias ta="tmux a -t"
alias tls="tmux ls"
alias tn="tmux new -t"
alias fedora="toolbox enter --release 34"
