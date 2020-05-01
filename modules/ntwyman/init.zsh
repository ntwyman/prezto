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

alias mmm='prj mymove'
ulimit -n 5000
eval "$(direnv hook zsh)"

export AWS_VAULT_KEYCHAIN_NAME=login
