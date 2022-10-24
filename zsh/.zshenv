export EDITOR=vi
export VISUAL=nvim
export HOMEBREW_NO_ANALYTICS=1

# Redefine XDG Base Directory Specifications for macOS compatibility
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_STATE_HOME="$HOME/.local/state"

export LESSHISTFILE="$XDG_CACHE_HOME"/less/history

export RUSTUP_HOME="$XDG_DATA_HOME"/rustup
export CARGO_HOME="$XDG_DATA_HOME"/cargo
[ -f "$XDG_DATA_HOME/.cargo/env" ] && source "$XDG_DATA_HOME/.cargo/env"

export ZEPHYR_SDK_INSTALL_DIR=$HOME/.local/opt/zephyr-sdk-0.14.2
[ -f "$HOME/Projects/zephyrproject/zephyr/zephyr-env.sh" ] && source "$HOME/Projects/zephyrproject/zephyr/zephyr-env.sh"

typeset -U path
path=(
	"$HOME/.local/bin"
	"/opt/homebrew/Cellar/bison/3.8.2/bin"
	"/opt/homebrew/opt/python@3.8/bin"
	"/Users/nomnp/Library/Python/3.10/bin"
	"/opt/homebrew/opt/fzf/bin"
	$path)
export PATH
