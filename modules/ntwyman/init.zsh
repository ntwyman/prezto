#
# Personalizes [my](https://github.com/ntwyman) [prezto](https://github.com/sorin-ionescu/prezto) environment
#

function prj {
    cd $HOME/src/$1
}
compctl -W $HOME/src -/ prj

function container {
    project=${1:-seL4_play}
    make -C /$HOME/src/sel4_dockerfiles user HOST_DIR=$HOME/src/${project}
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
if [ -d $HOME/miniconda3 ]; then
    # !! Contents within this block are managed by 'conda init' !!
    __conda_setup="$('$HOME/miniconda3/bin/conda' 'shell.zsh' 'hook' 2>/dev/null)"
    if [ $? -eq 0 ]; then
        eval "$__conda_setup"
    else
        if [ -f "$HOME/miniconda3/etc/profile.d/conda.sh" ]; then
            . "$HOME/miniconda3/etc/profile.d/conda.sh"
        else
            export PATH="$HOME/miniconda3/bin:$PATH"
        fi
    fi
    unset __conda_setup
fi
# <<< conda initialize <<<

if which swiftenv >/dev/null; then
    eval "$(swiftenv init -)"
fi

if [ -d $HOME/esp/esp-idf ]; then
    alias idf_on='. $HOME/esp/esp-idf/export.sh && . $HOME/esp/esp-matter/export.sh'
fi
