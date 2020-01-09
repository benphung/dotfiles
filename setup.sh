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
