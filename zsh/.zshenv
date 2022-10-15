export EDITOR=vi
export VISUAL=nvim
export HOMEBREW_NO_ANALYTICS=1

export ZEPHYR_SDK_INSTALL_DIR=$HOME/.local/opt/zephyr-sdk-0.14.2
[ -f "$HOME/Projects/zephyrproject/zephyr/zephyr-env.sh" ] && source "$HOME/Projects/zephyrproject/zephyr/zephyr-env.sh"

[ -f "$HOME/.cargo/env" ] && source "$HOME/.cargo/env"

typeset -U path
path=(
	"$HOME/.local/bin"
	"/opt/homebrew/Cellar/bison/3.8.2/bin"
	"/opt/homebrew/opt/python@3.8/bin"
	"/Users/nomnp/Library/Python/3.10/bin"
	$path)
export PATH

if [[ ! "$PATH" == */opt/homebrew/opt/fzf/bin* ]]; then
	export PATH="${PATH:+${PATH}:}/opt/homebrew/opt/fzf/bin"
fi
