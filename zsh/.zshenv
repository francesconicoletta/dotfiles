export EDITOR=nvim
export PATH=$HOME/.local/bin:$PATH
#export SUDO_ASKPASS=$HOME/.local/bin/dmenupass
#export XSECURELOCK_BLANK_TIMEOUT=0
export CONDA_AUTO_ACTIVATE_BASE=false

# Nix
if [ -e /home/nomad/.nix-profile/etc/profile.d/nix.sh ]; then . /home/nomad/.nix-profile/etc/profile.d/nix.sh; fi # added by Nix installer
