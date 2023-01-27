# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
setopt autocd
bindkey -v

autoload -Uz compinit
compinit
# For autocompletion
if [ -f /opt/local/etc/profile.d/bash_completion.sh ]; then
  . /opt/local/etc/profile.d/bash_completion.sh
fi

# alias for tmux shell script
alias dev="sh ~/Development/scripts/dev.sh"
# alias pip=pip3
# alias python3=python3.7

# Navi things
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"
# VIRTUALENVWRAPPER_PYTHON=$(which python3)
# export WORKON_HOME=$HOME/.virtualenvs
# source /usr/local/bin/virtualenvwrapper.sh

# Prefer exa over ls
if type exa > /dev/null 2>&1; then
  alias l='exa -l --icons'
  alias ls='exa --icons'
  alias la='exa -a --icons'
else
  alias l='ls -l'
  alias ls='ls'
  alias la='ls -a'
fi

eval "$(starship init zsh)"

# Volta path addition
export VOLTA_HOME="$HOME/.volta"
export PATH="$VOLTA_HOME/bin:$PATH"

if [[ ! -f $HOME/.zi/bin/zi.zsh ]]; then
  print -P "%F{33}▓▒░ %F{160}Installing (%F{33}z-shell/zi%F{160})…%f"
  command mkdir -p "$HOME/.zi" && command chmod g-rwX "$HOME/.zi"
  command git clone -q --depth=1 --branch "main" https://github.com/z-shell/zi "$HOME/.zi/bin" && \
    print -P "%F{33}▓▒░ %F{34}Installation successful.%f%b" || \
    print -P "%F{160}▓▒░ The clone has failed.%f%b"
fi
source "$HOME/.zi/bin/zi.zsh"
autoload -Uz _zi
(( ${+_comps} )) && _comps[zi]=_zi
# examples here -> https://z.digitalclouds.dev/ecosystem/annexes
zicompinit # <- https://z.digitalclouds.dev/docs/guides/commands
zi light zsh-users/zsh-syntax-highlighting
zi light zsh-users/zsh-completions
zi light zsh-users/zsh-autosuggestions

export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion