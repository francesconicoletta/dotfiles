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

# Toolbox
alias fedora="toolbox enter --release 34"
alias ubuntu="toolbox enter ubuntu-toolbox-latest"

source /usr/share/doc/fzf/examples/key-bindings.zsh
source /usr/share/doc/fzf/examples/completion.zsh

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/home/nomad/Projects/anaconda/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/home/nomad/Projects/anaconda/etc/profile.d/conda.sh" ]; then
        . "/home/nomad/Projects/anaconda/etc/profile.d/conda.sh"
    else
        export PATH="/home/nomad/Projects/anaconda/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

