#!/usr/bin/env bash

# Install command-line tools using Homebrew.

# Make sure we’re using the latest Homebrew.
brew update

# Upgrade any already-installed formulae.
brew upgrade

# Save Homebrew’s installed location.
BREW_PREFIX=$(brew --prefix)

# Install GNU core utilities (those that come with macOS are outdated).
# Don’t forget to add `$(brew --prefix coreutils)/libexec/gnubin` to `$PATH`.
brew install coreutils

# Install more recent versions of some macOS tools.
brew install vim
brew install openssh
brew install git

# Install useful tools
brew install wget
brew install fd
brew install fzf
brew install bat
brew install syncthing
brew install ripgrep
brew install pure
brew install jq
brew install zsh

brew install FelixKratz/formulae/sketchybar
brew install koekeishiya/formulae/yabai
brew install koekeishiya/formulae/skhd

# Start services
brew services start syncthing
brew services start yabai
brew services start skhd
brew services start sketchybar

# Install fonts

brew tap homebrew/cask-fonts
brew install --cask font-fira-code
brew install --cask font-hack-nerd-font
brew install --cask sf-symbols
brew install --cask betterdisplay

# Ligaturized ubuntu mono:
# https://github.com/vizhub-core/ubuntu-mono-ligaturized

# Cascadia font:
# https://github.com/microsoft/cascadia-code

# Remove outdated versions from the cellar.
brew cleanup
