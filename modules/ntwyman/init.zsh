#
# Personalizes [my](https://github.com/ntwyman) [prezto](https://github.com/sorin-ionescu/prezto) environment
#

function prj {
    cd $HOME/src/$1
}
compctl -W $HOME/src -/ prj

function container {
    make -C /$HOME/src/seL4-CAmkES-L4v-dockerfiles user HOST_DIR=$(pwd)
}

#
# Aliases
#
alias src='cd ~/src/'
alias goops='git reset --soft HEAD~1'
alias pjr='prj'
alias fga='alias | grep git | grep'
alias brc='ssh bramble-control.local'
alias br0='ssh bramble-worker0.local'
alias br1='ssh bramble-worker1.local'

# Add jp to pretty print json if we have jq
if [ $(command -v jq) ]; then
    alias jp="jq '.'"
fi

# VScode
if [ -d /Applications/Visual\ Studio\ Code.app/Contents/Resources/app/bin ]; then
    alias code='/Applications/Visual\ Studio\ Code.app/Contents/Resources/app/bin/code'
fi

[ -f "${GHCUP_INSTALL_BASE_PREFIX:=$HOME}/.ghcup/env" ] && source "${GHCUP_INSTALL_BASE_PREFIX:=$HOME}/.ghcup/env"

if [ $(uname) = "Darwin" ]; then
    ulimit -n 5000
fi

if [ $(command -v direnv) ]; then
    eval "$(direnv hook zsh)"
fi

if [ -d $HOME/.cargo ]; then
    . "$HOME/.cargo/env"
    path+=$HOME/.cargo/bin
fi
if [ -f $HOME/.docker/init-zsh.sh ]; then
    source $HOME/.docker/init-zsh.sh
fi

if [ -d $HOME/.local/share/ponyup ]; then
    path+=$HOME/.local/share/ponyup/bin
fi

if [ -d $HOME/.local/bin ]; then
    path+=$HOME/.local/bin
fi

if [ -d $HOME/bin ]; then
    path+=$HOME/bin
fi

if [ -d $HOME/.asdf ]; then
    . "$HOME/.asdf/asdf.sh"
fi

if [ -d $HOME/Applications/flutter ]; then
    path+=$HOME/Applications/flutter/bin
fi

setopt +o nomatch
jdir=$(ls -d /Applications/Julia* 2>/dev/null)
setopt -o nomatch
if [ -d $jdir/Contents/Resources/julia/bin ]; then
    alias julia="$jdir/Contents/Resources/julia/bin/julia"
fi

export AWS_VAULT_KEYCHAIN_NAME=login

export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"

[[ -s "$HOME/.nix-profile/etc/profile.d/nix.sh" ]] && source "$HOME/.nix-profile/etc/profile.d/nix.sh"

[[ -d /opt/homebrew ]] && eval "$(/opt/homebrew/bin/brew shellenv)"

if type brew &>/dev/null; then
    FPATH=$(brew --prefix)/share/zsh-completions:$FPATH

    autoload -Uz compinit
    compinit
fi

# >>> conda initialize >>>
if [[ -d $HOME/miniconda3 || -d /opt/anaconda3 ]]; then
    if [[ -d $HOME/miniconda3 ]]; then
        CONDA_BASE="$HOME/miniconda3"
    else
        CONDA_BASE="/opt/anaconda3"
    fi
    # !! Contents within this block are managed by 'conda init' !!
    __conda_setup="$(${CONDA_BASE}/bin/conda 'shell.zsh' 'hook')"
    if [ $? -eq 0 ]; then
        eval "$__conda_setup"
    else
        if [ -f "$CONDA_BASE/etc/profile.d/conda.sh" ]; then
            . "$CONDA_BASE/etc/profile.d/conda.sh"
        else
            path+="$CONDA_BASE/bin"
        fi
    fi
    unset __conda_setup
fi

if which swiftenv >/dev/null; then
    eval "$(swiftenv init -)"
fi

if [ -d $HOME/esp/esp-idf ]; then
    alias idf_on='. $HOME/esp/esp-idf/export.sh && . $HOME/esp/esp-matter/export.sh'
fi

if [ -h "/opt/homebrew/bin/assume" ]; then
    alias assume="source /opt/homebrew/bin/assume"
fi

if [ -x "/opt/homebrew/bin/terraform" ]; then
    # May need to move bashcompinit if it is used elsewhere
    autoload -U +X bashcompinit && bashcompinit
    complete -o nospace -C /opt/homebrew/bin/terraform terraform
fi

if [ -d $HOME/Library/pnpm ]; then
    export PNPM_HOME="$HOME/Library/pnpm"
    case ":$PATH:" in
    *":$PNPM_HOME:"*) ;;
    *) export PATH="$PNPM_HOME:$PATH" ;;
    esac
fi
