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
    ```
4. Pywal
    ```
    pip3 install pywal
    wal --theme base16-nord
    ```
    Fix for invisible cursor: https://github.com/dylanaraps/pywal/issues/382

5. Additional
    ```
    $ git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
    $ npm install --global pure-prompt
    ```

