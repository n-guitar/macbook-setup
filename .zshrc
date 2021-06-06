# 補完機能
autoload -U compinit
compinit

# 色を利用
autoload -Uz colors
colors

# historyの重複削除
setopt histignorealldups
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000

# よく使うAlias
alias ll='ls -la'

# homebrew
export PATH=$PATH:/opt/homebrew/bin:/opt/homebrew/sbin

# Git
fpath=(~/.zsh $fpath)
if [ -f ${HOME}/.zsh/git-completion.zsh ]; then
    zstyle ':completion:*:*:git:*' script ~/.zsh/git-completion.zsh
fi
if [ -f ${HOME}/.zsh/git-prompt.sh ]; then
    source ${HOME}/.zsh/git-prompt.sh
fi
GIT_PS1_SHOWDIRTYSTATE=true
GIT_PS1_SHOWUNTRACKEDFILES=true
GIT_PS1_SHOWSTASHSTATE=true
GIT_PS1_SHOWUPSTREAM=auto
setopt PROMPT_SUBST ; PS1='[%n@ %c$(__git_ps1 " (%s)")]
$ '

# pyenv
eval "$(pyenv init -)"
export PATH=$HOME/.pyenv/shims:$PATH

# history補完
source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh

# vnm
export NVM_DIR="$HOME/.nvm"
[ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && . "/opt/homebrew/opt/nvm/nvm.sh"  # This loads nvm
[ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && . "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion

# node
export PATH=$HOME/.nodebrew/current/bin:$PATH

# kubectl
[[ /usr/local/bin/kubectl ]] && source <(kubectl completion zsh)

# goenv
export GOENV_ROOT="$HOME/.goenv"
export PATH="$GOENV_ROOT/bin:$PATH"
eval "$(goenv init -)"
export GOPATH="$HOME/go"
export PATH="$GOROOT/bin:$PATH"
export PATH="$PATH:$GOPATH/bin"