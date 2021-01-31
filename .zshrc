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
## arm版vscodeがstableになるまで
alias code='code-insiders'

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
