#!/bin/bash

if test ! $(which brew); then
    echo "Installing homebrew..."
    ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

echo "Updating homebrew..."
brew update

echo "Installing packages..."
IFS=$'\n' PACKAGES=($(<leaves))
brew install ${PACKAGES[@]}

echo "Tapping..."
brew tap homebrew/cask-fonts
brew install font-iosevka-nerd-font --cask --fontdir=/Library/Fonts
brew install font-iosevka-nerd-font-mono -- cask --fontdir=/Library/Fonts

echo "Installing casks..."
IFS=$'\n' CASKS=($(<casks))
brew install ${CASKS[@]} --cask

echo "Upgrading packages..."
brew upgrade

echo "Cleaning up..."
brew cleanup

echo "Doctoring..."
brew doctor
