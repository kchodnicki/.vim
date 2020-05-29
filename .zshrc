if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

export ZSH="/Users/chodnicki/.oh-my-zsh"

ZSH_THEME="powerlevel10k/powerlevel10k"

export FZF_BASE=/usr/local/bin/fzf

plugins=(git colored-man-pages colorize pip python brew osx zsh-autosuggestions fzf git-flow history node npm kubectl)

source $ZSH/oh-my-zsh.sh

eval "$(ssh-agent)" > /dev/null 2>&1
ssh-add -K ~/.ssh/id_ed25519 > /dev/null 2>&1

alias ohmyzsh="vim ~/.oh-my-zsh"
alias ls="exa"
alias l='exa -l'
alias la='exa -a'
alias ll='exa -la'
alias lt='exa --tree'
alias k='kubectl'

eval "$(pyenv init -)"

[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

export PATH="/usr/local/opt/binutils/bin:$PATH"
export PATH="/usr/local/opt/m4/bin:$PATH"
export PATH="/usr/local/opt/gnu-which/libexec/gnubin:$PATH"
export PATH="/usr/local/opt/gnu-tar/libexec/gnubin:$PATH"
export PATH="/usr/local/opt/gnu-sed/libexec/gnubin:$PATH"
export PATH="/usr/local/opt/gnu-indent/libexec/gnubin:$PATH"
export PATH="/usr/local/opt/flex/bin:$PATH"
export PATH="/usr/local/opt/findutils/libexec/gnubin:$PATH"
export PATH="/usr/local/opt/ed/libexec/gnubin:$PATH"
export PATH="/Users/chodnicki/go/bin/:$PATH"
