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

# alias cat to bat
alias cat='bat'

# alias for tmux shell script
alias dev="sh ~/Development/scripts/dev.sh"

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

# Config for nvm, which lets us switch Node versions easily (https://github.com/creationix/nvm)
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion


### Added by Zinit's installer
if [[ ! -f $HOME/.zinit/bin/zinit.zsh ]]; then
    print -P "%F{33}▓▒░ %F{220}Installing %F{33}DHARMA%F{220} Initiative Plugin Manager (%F{33}zdharma/zinit%F{220})…%f"
    command mkdir -p "$HOME/.zinit" && command chmod g-rwX "$HOME/.zinit"
    command git clone https://github.com/zdharma/zinit "$HOME/.zinit/bin" && \
        print -P "%F{33}▓▒░ %F{34}Installation successful.%f%b" || \
        print -P "%F{160}▓▒░ The clone has failed.%f%b"
fi

source "$HOME/.zinit/bin/zinit.zsh"
eval "$(starship init zsh)"
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit

# Load a few important annexes, without Turbo
# (this is currently required for annexes)
zinit light-mode for \
    zinit-zsh/z-a-rust \
    zinit-zsh/z-a-as-monitor \
    zinit-zsh/z-a-patch-dl \
    zinit-zsh/z-a-bin-gem-node

### End of Zinit's installer chunk

zinit ice lucid wait"0" atload"_zsh_autosuggest_start"
zinit light zsh-users/zsh-autosuggestions

zinit ice lucid wait"0" atinit"zpcompinit; zpcdreplay"
zinit light zdharma/fast-syntax-highlighting
