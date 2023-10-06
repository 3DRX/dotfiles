# zsh internal configs
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
    source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi
export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="powerlevel10k/powerlevel10k"
export LC_CTYPE=zh_CN.UTF-8
DISABLE_AUTO_TITLE="true"
plugins=(
    git
    autojump
    zsh-autosuggestions
)
source $ZSH/oh-my-zsh.sh
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# user commands
proxy () {
    export http_proxy=http://127.0.0.1:7890
    export https_proxy=http://127.0.0.1:7890
    echo "proxy on"
}
noproxy () {
    unset http_proxy
    unset https_proxy
    echo "proxy off"
}
export http_proxy=http://127.0.0.1:7890
export https_proxy=http://127.0.0.1:7890
ff() {
    cd $(find * -type d | fzf)
}
use_depot() {
    PATH="/home/kjy/Documents/depot_tools:$PATH"
    echo "depot_tools added to PATH"
}
use_bin() {
    PATH="/home/kjy/bin:$PATH"
    echo "~/bin added to PATH"
}
vman() {
    vim <(man $1);
}
ch() {
    ~/.cht.sh
}

# application settings

# nvm
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# conda
__conda_setup="$('/home/kjy/miniconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/home/kjy/miniconda3/etc/profile.d/conda.sh" ]; then
        . "/home/kjy/miniconda3/etc/profile.d/conda.sh"
    else
        export PATH="/home/kjy/miniconda3/bin:$PATH"
    fi
fi
unset __conda_setup

# pipx
export PATH="$PATH:/home/kjy/.local/bin"

# bun
[ -s "/home/kjy/.bun/_bun" ] && source "/home/kjy/.bun/_bun"
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"
