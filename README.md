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
5. Pure
    ```
    $ npm install --global pure-prompt
    ```
6. Additional
    ```
    $ git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
    ```

