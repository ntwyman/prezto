#
# Personalizes [my](https://github.com/ntwyman) [prezto](https://github.com/sorin-ionescu/prezto) environment
#

function prj {
    cd $HOME/src/$1
}
compctl -W $HOME/src -/ prj 

function container {
  project=${1:-seL4_play}
  make -C /$HOME/src/seL4-CAmkES-L4v-dockerfiles user HOST_DIR=$HOME/src/${project}
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
if [ `command -v jq` ]; then
    alias jp="jq '.'"
fi

# VScode
if [ -d /Applications/Visual\ Studio\ Code.app/Contents/Resources/app/bin ]; then
	alias code='/Applications/Visual\ Studio\ Code.app/Contents/Resources/app/bin/code'
fi

[ -f "${GHCUP_INSTALL_BASE_PREFIX:=$HOME}/.ghcup/env" ] && source "${GHCUP_INSTALL_BASE_PREFIX:=$HOME}/.ghcup/env"

if [ `uname` = "Darwin" ]; then
    ulimit -n 5000
fi

if [ `command -v direnv` ]; then
    eval "$(direnv hook zsh)"
fi

if [ -d $HOME/.cargo ]; then
    path+=$HOME/.cargo/bin
fi

if [ -d $HOME/bin ]; then
    path+=$HOME/bin
fi

jdir=`ls -d /Applications/Julia*`
if [ -d $jdir/Contents/Resources/julia/bin ] ; then
    alias julia="$jdir/Contents/Resources/julia/bin/julia"
fi

export AWS_VAULT_KEYCHAIN_NAME=login

export SDKMAN_DIR="/Users/nick/.sdkman"
[[ -s "/Users/nick/.sdkman/bin/sdkman-init.sh" ]] && source "/Users/nick/.sdkman/bin/sdkman-init.sh"


[[ -s "$HOME/.nix-profile/etc/profile.d/nix.sh" ]] && source "$HOME/.nix-profile/etc/profile.d/nix.sh"
