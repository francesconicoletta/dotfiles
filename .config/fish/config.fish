if status is-interactive
	set -x EDITOR vim
	set -x VISUAL vim
	set -x DOTFILES_DIR "$HOME/.local/share/dotfiles"
	set -x HOMEBREW_NO_ANALYTICS 1
	set -x XDG_CONFIG_HOME "$HOME/.config"
	set -x XDG_CACHE_HOME "$HOME/.cache"
	set -x XDG_DATA_HOME "$HOME/.local/share"
	set -x XDG_STATE_HOME "$HOME/.local/state"
	set -x NPM_CONFIG_USERCONFIG "$XDG_CONFIG_HOME/npm/npmrc"
	set -x CONDARC "$XDG_CONFIG_HOME/conda/condarc"
	set -x RUSTUP_HOME "$XDG_DATA_HOME/rustup"
	set -x CARGO_HOME "$XDG_DATA_HOME/cargo"
	set -x GNUPGHOME "$XDG_DATA_HOME/gnupg"
	set -x IPYTHONDIR "$XDG_CONFIG_HOME/ipython"
	set -x JUPYTER_CONFIG_DIR "$XDG_CONFIG_HOME/jupyter"
	set -x TERMINFO "$XDG_DATA_HOME/terminfo"
	set -x TERMINFO_DIRS "$XDG_DATA_HOME/terminfo:/usr/share/terminfo"
	set -x LESSHISTFILE "$XDG_CACHE_HOME/less/history"
	set -x ET_NO_TELEMETRY no
	[ -f "$XDG_DATA_HOME/.cargo/env" ] && source "$XDG_DATA_HOME/.cargo/env"

	eval "$(/opt/homebrew/bin/brew shellenv)"
	set -g fish_greeting ""
	bind \cx\ce edit_command_buffer

	fish_add_path "/opt/homebrew/opt/llvm/bin"
	fish_add_path "$HOME/.local/bin"
	fish_add_path "/opt/homebrew/opt/fzf/bin"
	fish_add_path "/opt/homebrew/opt/ccache/libexec"

	function take
		mkdir -p -- "$argv[1]"
		cd -- "$argv[1]"
	end

	function pbfilter
		if test (count $argv) -gt 0
			pbpaste | $argv | pbcopy
		end
	end

	function dots -w git -d "Manages dotfiles"
		git --git-dir=$HOME/.config/.dotfiles.git --work-tree=$HOME $argv
	end

	alias brew-deep-cleanup="brew cleanup --prune=1 -s"
	alias dump_net="scutil -d -v --nwi"
	alias gitroot='cd "$(git rev-parse --show-toplevel)"'
	alias idocs="cd $HOME/Library/Mobile\ Documents/com~apple~CloudDocs/Documents"
	alias jsonform="pbpaste | jq | pbcopy"
	alias la="ls -lah"
	alias mosh="LANG=en_US.UTF-8 LC_CTYPE=en_US.UTF-8 mosh"
	alias rg="rg --hidden"
	alias rgai="rga --rga-adapters=+pdfpages,tesseract"
	alias ta="tmux a -t"
	alias temptake="take $(mktemp -d)"
	alias tls="tmux ls"
	alias tn="tmux new -t"
	alias updatedb="/usr/libexec/locate.updatedb"
	alias watch="watch "
	alias zzz="pmset sleepnow"

	abbr --add ga --position command git add
	abbr --add gc --position command git commit -s
	abbr --add gca --position command git commit -s --amend
	abbr --add gd --position command git diff
	abbr --add gdo --position command git dog abbr --add gsw git switch
	abbr --add gds --position command git diff --staged
	abbr --add ggr --position command --set-cursor git grep -inp \'%\'
	abbr --add gjd --position command git jump diff
	abbr --add gjg --position command --set-cursor git jump grep \'%\'
	abbr --add gjm --position command git jump merge
	abbr --add gl --position command git log
	abbr --add glo --position command git log --oneline
	abbr --add gs --position command git status
	abbr --add gst --position command git stash

	fzf --fish | source
	zoxide init fish | source
	source "$HOME/.iterm2_shell_integration.fish"
	source "/opt/homebrew/Library/Taps/homebrew/homebrew-command-not-found/handler.fish"

end
