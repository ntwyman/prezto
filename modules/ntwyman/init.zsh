#
# Personalizes [my](https://github.com/ntwyman) [prezto](https://github.com/sorin-ionescu/prezto) environment
#

function prj {
    cd $HOME/src/$1
}
compctl -W $HOME/src -/ prj 

#
# Aliases
#
alias src='cd ~/src/'
alias goops='git reset --soft HEAD~1'
alias pjr='prj'
alias fga='alias | grep git | grep'

# Add jp to pretty print json if we have jq 
if [ `command -v jq` ]; then
    alias jp="jq '.'"
fi

# VScode
if [ -d /Applications/Visual\ Studio\ Code.app/Contents/Resources/app/bin ]; then
	alias code='/Applications/Visual\ Studio\ Code.app/Contents/Resources/app/bin/code'
fi

[ -f "${GHCUP_INSTALL_BASE_PREFIX:=$HOME}/.ghcup/env" ] && source "${GHCUP_INSTALL_BASE_PREFIX:=$HOME}/.ghcup/env"

alias mmm='prj mymove'
ulimit -n 5000

eval "$(direnv hook zsh)"
if [ `command -v direnv` ]; then 
    eval "$(direnv hook bash)"
fi

if [ -d $HOME/.cargo ]; then
    path+=$HOME/.cargo/bin
fi

if [ -d $HOME/src/seL4-CAmkES-L4v-dockerfiles ]; then
   alias container="make -C /$HOME/src/seL4-CAmkES-L4v-dockerfiles user HOST_DIR=$HOME/src/seL4_play"
fi

export AWS_VAULT_KEYCHAIN_NAME=login

