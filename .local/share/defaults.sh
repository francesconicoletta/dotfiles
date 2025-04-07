#!/bin/sh

set -eu

# Set the dock size
defaults write com.apple.dock "tilesize" -int "44"
# Automatically hide the Dock
defaults write com.apple.dock "autohide" -bool "false" && killall Dock
# Disable the Dock's hide animation
defaults write com.apple.dock "autohide-time-modifier" -float "0"
# Remove the Dock opening delay
defaults write com.apple.dock "autohide-delay" -float "0"
# Change the Dock minimize animation
defaults write com.apple.dock "mineffect" -string "suck"
# Scroll to Exposé app
defaults write com.apple.dock "scroll-to-open" -bool "true"
# Disable automatically rearranging spaces in Mission Control
defaults write com.apple.dock "mru-spaces" -bool "false"
# Drag a file over an icon in the Dock, hover, and open it with the application
defaults write com.apple.dock "enable-spring-load-actions-on-all-items" -bool "true"
killall Dock

# Show the full URL in Safari
defaults write com.apple.Safari "ShowFullURLInSmartSearchField" -bool "true"
# Don't automatically open files after downloads
defaults write com.apple.Safari "AutoOpenSafeDownloads" -bool "false"
# Show developer menu
defaults write com.apple.Safari "IncludeDevelopMenu" -bool "true"
killall Safari

# Show file extensions on the Finder
defaults write -g "AppleShowAllExtensions" -bool "true"
# Show path bar on the Finder
defaults write com.apple.finder "ShowPathbar" -bool "true"
killall Finder

# Drag windows with ⌃ ⌘ click
defaults write -g NSWindowShouldDragOnGesture -bool true
# Disable window jumping when dragging
defaults write -g NSWindowShouldDragOnGestureFeedback -bool false

# Change key held down behavior to repeat
defaults write -g "ApplePressAndHoldEnabled" -bool "false"
# Change key repeat speed and delay
defaults write -g InitialKeyRepeat -int 15
defaults write -g KeyRepeat -int 2

# Disable autocorrect
defaults write -g "NSAutomaticSpellingCorrectionEnabled" -bool "false"

# Enable keyboard navigation with Tab and Shift Tab
defaults write -g "AppleKeyboardUIMode" -int "0"

# Prevent the creation of .DS_Store files on network shares
defaults write com.apple.desktopservices "DSDontWriteNetworkStores" -bool "true"
