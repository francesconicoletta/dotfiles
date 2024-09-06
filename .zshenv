export EDITOR=vim
export VISUAL=vim
export DOTFILES_DIR="$HOME/.local/share/dotfiles"
export HOMEBREW_NO_ANALYTICS=1
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_STATE_HOME="$HOME/.local/state"
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
export ET_NO_TELEMETRY=no
[ -f "$XDG_DATA_HOME/.cargo/env" ] && source "$XDG_DATA_HOME/.cargo/env"

typeset -U path
path+=(
	"$HOME/.local/bin"
	"/opt/homebrew/bin"
	"/opt/homebrew/opt/fzf/bin"
	"/opt/homebrew/opt/ccache/libexec"
	$path
)

export PATH
export FPATH="/opt/homebrew/share/zsh/site-functions:${FPATH}"
