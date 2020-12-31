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

export GOPRIVATE=*.f5net.com
export GOPATH=/Users/chodnicki/go

alias ohmyzsh="vim ~/.oh-my-zsh"
alias ls="exa"
alias l='exa -l'
alias la='exa -a'
alias ll='exa -lah'
alias lt='exa --tree'
alias k='kubectl'
alias vim='nvim'
alias vi='nvim'

export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
export PIP_EXTRA_INDEX_URL=https://artifactory.f5net.com/artifactory/api/pypi/f5-pypi/simple

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

export PATH="/usr/local/opt/ed/libexec/gnubin:$PATH"
export PATH="/Users/chodnicki/go/bin/:$PATH"
export PATH="/usr/local/opt/llvm/bin/:$PATH"
export PATH="/usr/local/opt/openjdk/bin:$PATH"
eval "$(pyenv init -)"
if which pyenv-virtualenv-init > /dev/null; then eval "$(pyenv virtualenv-init -)"; fi
