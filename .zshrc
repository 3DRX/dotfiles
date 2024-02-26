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
ff() {
    cd $(find * -type d | fzf)
}
vman() {
    vim <(man $1);
}
ch() {
    ~/.cht.sh
}
case `uname` in
  Darwin)
    proxy () {
      export http_proxy=http://127.0.0.1:20172
      export https_proxy=http://127.0.0.1:20172
      echo "proxy on"
    }
    noproxy () {
      unset http_proxy
      unset https_proxy
      echo "proxy off"
    }
    export http_proxy=http://127.0.0.1:20172
    export https_proxy=http://127.0.0.1:20172
  ;;
  Linux)
    use_depot() {
      PATH="/home/kjy/Documents/depot_tools:$PATH"
      echo "depot_tools added to PATH"
    }
    use_bin() {
      PATH="/home/kjy/bin:$PATH"
      echo "~/bin added to PATH"
    }
    fullspeed_fan() {
      echo "level 7" | sudo tee /proc/acpi/ibm/fan
    }
    autospeed_fan() {
      echo "level auto" | sudo tee /proc/acpi/ibm/fan
    }
    fullspeed_clock() {
      sudo cpupower frequency-set --governor performance
    }
    autospeed_clock() {
      sudo cpupower frequency-set --governor powersave
    }
  ;;
  FreeBSD)
  ;;
esac

# application settings
case `uname` in
  Darwin)
    # nvm
    export NVM_DIR="$HOME/.nvm"
    [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
    [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

    # conda
    __conda_setup="$('/usr/local/Caskroom/miniconda/base/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
    if [ $? -eq 0 ]; then
        eval "$__conda_setup"
    else
        if [ -f "/usr/local/Caskroom/miniconda/base/etc/profile.d/conda.sh" ]; then
            . "/usr/local/Caskroom/miniconda/base/etc/profile.d/conda.sh"
        else
            export PATH="/usr/local/Caskroom/miniconda/base/bin:$PATH"
        fi
    fi
    unset __conda_setup

    export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"
  ;;
  Linux)
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
  ;;
  FreeBSD)
  ;;
esac
