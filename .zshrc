# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Look in ~/.oh-my-zsh/themes/
# ZSH_THEME="agnoster"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(z colored-man-pages)

source $(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh
source $ZSH/oh-my-zsh.sh

export VISUAL=nvim
export EDITOR="$VISUAL"

HISTSIZE=10000000
SAVEHIST=10000000

alias awk1="awk '{print \$1}'"
alias awk2="awk '{print \$2}'"
alias awk3="awk '{print \$3}'"
alias awk4="awk '{print \$4}'"
alias awk5="awk '{print \$5}'"

export DEFAULT_USER=`whoami`
export TERM=xterm-256color


# LOCAL
if [ -f ~/.zsh_local ]; then
  source ~/.zsh_local
fi


# PATH
export PATH=$PATH:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin
export PATH="$PATH:/Applications/Visual Studio Code.app/Contents/Resources/app/bin"

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"


# ALIAS
if type nvim > /dev/null 2>&1; then
  alias vim='nvim'
fi
alias xcode='xed .'
alias stree='open -a /Applications/SourceTree.app'
alias code="open -a 'Visual Studio Code'"
alias g='git'
alias marked='open -a "/Applications/Marked 2.app"'


# RANDOM
export FZF_DEFAULT_COMMAND='rg --files --no-ignore --hidden --follow --glob "!.git/*"'

# PURE THEME (https://github.com/sindresorhus/pure)
# Run npm install --global pure-prompt
autoload -U promptinit; promptinit
# zstyle :prompt:pure:prompt:success color green
prompt pure

# wal
# Run "wal --theme base16-nord"
# Fix cursor issue: https://github.com/dylanaraps/pywal/issues/382
# "copied the current contents of sequences.py from github into /usr/local/lib/python3.7/site-packages/pywal/sequences.py"

# Import colorscheme from 'wal' asynchronously
# &   # Run the process in the background.
# ( ) # Hide shell job control messages.
(cat ~/.cache/wal/sequences &)

# Alternative (blocks terminal for 0-3ms)
cat ~/.cache/wal/sequences

# To add support for TTYs this line can be optionally added.
source ~/.cache/wal/colors-tty.sh

function ide() {
  tmux split-window -v -p 30
  tmux split-window -h -p 66
  tmux split-window -h -p 50
}

# Start tmux
if command -v tmux &> /dev/null && [ -z "$TMUX" ]; then
  tmux attach -t default || tmux new -s default
fi
