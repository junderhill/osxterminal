# Path to your oh-my-zsh installation.
export ZSH=/Users/jason/.oh-my-zsh
export GOPATH=/Users/$USER/Code/go
export GOBIN=$GOPATH/bin
export PATH=$GOBIN:$PATH

export PATH="$HOME/.plenv/bin:$PATH"
eval "$(plenv init -)"

# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
# ZSH_THEME="robbyrussell"
ZSH_THEME="dracula"

#Enable vi mode
bindkey -v

plugins=(
  git
  docker
  dotnet
  tmux
  aws
  vi-mode
  thefuck
  history 
  history-substring-search 
  brew
  zsh-syntax-highlighting
  z
  )


eval $(thefuck --alias)
source $ZSH/oh-my-zsh.sh
source $(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh


# User configuration

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi
