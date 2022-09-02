# dotfiles

1. Install command line developer tools
    ```
    $ git
    ```
2. Homebrew
    ```
    $ cd brew
    $ ./setup.sh
    ```
3. [oh-my-zsh](https://ohmyz.sh/)
    ```
    $ sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
    $ source ~/.zshrc
    ```
4. Symlink dotfiles
    ```
    $ ./setup.sh
    ```
5. Tmux
    1. Clone https://github.com/arcticicestudio/nord-tmux into `~/.tmux/themes/nord-tmux/nord.tmux`
    2. Reload tmux
6. Install Nord theme for iTerm2 from https://github.com/arcticicestudio/nord-iterm2/releases or from this repo
7. Additional
    ```
    $ git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
    ```

