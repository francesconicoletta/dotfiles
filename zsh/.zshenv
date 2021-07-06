export EDITOR=vim
export PATH=$HOME/.local/bin:$PATH
export PATH=$PATH:$HOME/.cargo/bin
export SUDO_ASKPASS=$HOME/.local/bin/dmenupass
export XSECURELOCK_BLANK_TIMEOUT=0
export NOTMUCH_CONFIG=~/.config/notmuch/config

# Deno
export DENO_INSTALL="$HOME/.deno"
export PATH="$DENO_INSTALL/bin:$PATH"

# npm
export PATH="$HOME/.local/npm/bin:$PATH"
export npm_config_prefix="$HOME/.local/npm"
. "$HOME/.cargo/env"

# Rust
export PATH="$HOME/.cargo/bin:$PATH"
