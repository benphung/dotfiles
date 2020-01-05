#!/bin/bash
files=(".gitalias" ".spacemacs" ".tmux.conf" ".xvimrc" ".zshrc")
for file in "${files[@]}"; do
  ln -s -f $(realpath $file) ~/$file
done

ln -s -f ~/.config/nvim/init.vim ~/.vimrc
ln -s -f $(realpath config/karabiner/karabiner.json) ~/.config/karabiner/karabiner.json
ln -s -F $(realpath config/nvim) ~/.config
