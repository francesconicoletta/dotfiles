export EDITOR=vi
export VISUAL=nvim

export ZEPHYR_SDK_INSTALL_DIR=$HOME/.local/opt/zephyr-sdk-0.14.2
source "$HOME/Projects/zephyrproject/zephyr/zephyr-env.sh"

source "$HOME/.cargo/env"
export JAVA_HOME="/Library/Java/JavaVirtualMachines/openjdk.jdk/Contents/Home"

typeset -U path
path=(
	"$HOME/.local/bin"
	"/opt/homebrew/Cellar/bison/3.8.2/bin"
	"/opt/homebrew/opt/openjdk/bin"
	$path)
export PATH
