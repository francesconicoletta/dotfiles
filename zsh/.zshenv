export EDITOR=vi
export VISUAL=nvim
export HOMEBREW_NO_ANALYTICS=1

# Redefine XDG Base Directory Specifications for macOS compatibility
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_STATE_HOME="$HOME/.local/state"

typeset -U path
path=(
	"$HOME/.local/bin"
	$path
)

case "$OSTYPE" in
	darwin*)
	path+=(
	"/opt/homebrew/opt/fzf/bin"
	"/opt/homebrew/opt/ccache/libexec"
	)
	;;
esac

export PATH

# Use appropriate XDG directories
export NPM_CONFIG_USERCONFIG="$XDG_CONFIG_HOME"/npm/npmrc
export CONDARC="$XDG_CONFIG_HOME"/conda/condarc
export RUSTUP_HOME="$XDG_DATA_HOME"/rustup
export CARGO_HOME="$XDG_DATA_HOME"/cargo
export GNUPGHOME="$XDG_DATA_HOME"/gnupg
export IPYTHONDIR="$XDG_CONFIG_HOME"/ipython
export JUPYTER_CONFIG_DIR="$XDG_CONFIG_HOME"/jupyter
export TERMINFO="$XDG_DATA_HOME"/terminfo
export TERMINFO_DIRS="$XDG_DATA_HOME"/terminfo:/usr/share/terminfo
export LESSHISTFILE="$XDG_CACHE_HOME"/less/history

[ -f "$XDG_DATA_HOME/.cargo/env" ] && source "$XDG_DATA_HOME/.cargo/env"
