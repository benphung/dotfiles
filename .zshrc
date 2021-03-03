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
export COLORTERM=truecolor
export BAT_THEME=Nord


# LOCAL
if [ -f ~/.zsh_local ]; then
  source ~/.zsh_local
fi


# PATH
export PATH=$PATH:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin:/Library/Apple/usr/bin/
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
alias fork='open -a /Applications/Fork.app'

alias k='kubectl'
alias kg='kubectl get'
alias kgp='kubectl get pods'
alias kex='kubectl exec -it'
alias klo='kubectl logs -f'
alias kd='kubectl describe'

alias doc='docker'
alias docc='docker-compose'

source <(kubectl completion zsh)
complete -F __start_kubectl k

# RANDOM
export FZF_DEFAULT_COMMAND='rg --files --no-ignore --hidden --follow --glob "!.git/*"'

export FZF_DEFAULT_OPTS="
  --color fg:#D8DEE9,bg:#2E3440,hl:#A3BE8C,fg+:#D8DEE9,bg+:#434C5E,hl+:#A3BE8C
  --color pointer:#BF616A,info:#4C566A,spinner:#4C566A,header:#4C566A,prompt:#81A1C1,marker:#EBCB8B
"

# PURE THEME (https://github.com/sindresorhus/pure)
# Run npm install --global pure-prompt
autoload -U promptinit; promptinit
# zstyle :prompt:pure:prompt:success color green
prompt pure

function ide() {
  tmux split-window -v -p 30
  tmux split-window -h -p 66
  tmux split-window -h -p 50
}

function note() {
  local title="$1"
  local timestamp="$(date +%Y-%m-%d)"
  local dir="${HOME}/Dropbox/Notes"
  cd "${dir}"
  if [[ -n $1 ]]; then
    vim "$timestamp-$title.md"
  else
    vim .
  fi
}
alias notes="cd ~/Dropbox/Notes; vim"

function scratch() {
  nvim "+Scratch $*"
}

# Start tmux
if command -v tmux &> /dev/null && [ -z "$TMUX" ]; then
  tmux attach -t tmux || tmux new -s tmux
fi
