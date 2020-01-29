#!/bin/bash
files=(".gitalias" ".spacemacs" ".tmux.conf" ".xvimrc" ".zshrc")
for file in "${files[@]}"; do
  ln -s -f $(realpath $file) ~/$file
done

mkdir -p ~/.config/karabiner
ln -s -f $(realpath config/karabiner/karabiner.json) ~/.config/karabiner/karabiner.json

mkdir -p ~/.config/nvim
ln -s -F $(realpath config/nvim) ~/.config
ln -s -f ~/.config/nvim/init.vim ~/.vimrc

ln -s -f $(realpath preferences/iterm/com.googlecode.iterm2.plist) ~/Library/Preferences/com.googlecode.iterm2.plist

ln -s -f $(realpath vscode/settings.json) ~/Library/Application\ Support/Code/User/settings.json
