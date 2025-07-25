source "$HOME/.antidote/antidote.zsh"

antidote load ${ZDOTDIR:-$HOME}/.zsh_plugins.txt

alias json-pretty="python -m json.tool"
alias glm="git checkout master && git pull && git checkout -"
alias gld="git checkout develop && git pull && git checkout -"
alias glmd="glm && gld"

function glb() {
	if [ "$#" -ne 1 ]; then
		echo "Usage: $0 <branch to pull>" >&2
		return
	fi
	git checkout $1 && git pull && git checkout -
}

function gcomp() {
	if [ "$#" -ne 2 ]; then
		echo "Usage: $0 <branch to compare> <base branch>" >&2
		return
	fi
	git log $1 ^$2 --no-merges
}

function basic-auth() {
	if [ "$#" -ne 2 ]; then
		echo "Usage: $0 <username> <password>" >&2
		return
	fi
	echo "Basic $(echo -n "$1:$2" | base64)"
}

eval "$(direnv hook zsh)"

# This speeds up pasting w/ autosuggest
# https://github.com/zsh-users/zsh-autosuggestions/issues/238
pasteinit() {
  OLD_SELF_INSERT=${${(s.:.)widgets[self-insert]}[2,3]}
  zle -N self-insert url-quote-magic # I wonder if you'd need `.url-quote-magic`?
}

pastefinish() {
  zle -N self-insert $OLD_SELF_INSERT
}
zstyle :bracketed-paste-magic paste-init pasteinit
zstyle :bracketed-paste-magic paste-finish pastefinish

source <(fzf --zsh)

alias G="jump"
alias S="bookmark"
alias D="deletemark"
alias P="showmarks"
alias L="showmarks"

export PATH="/Users/lukas/.local/bin:$PATH"

# we need this so we can set the prompt when sourcing via direnv, see https://github.com/direnv/direnv/issues/268
setopt PROMPT_SUBST
show_virtual_env() {
  if [[ -n "$VIRTUAL_ENV" && -n "$DIRENV_DIR" ]]; then
    echo "($(basename $VIRTUAL_ENV))"
  fi
}
PS1='$(show_virtual_env)'$PS1

PATH="/Applications/Postgres.app/Contents/Versions/latest/bin:$PATH"

function jwt-decode {
  jq -R 'split(".") | .[0],.[1] | @base64d | fromjson' <<< "$1"
}

. ~/.asdf/plugins/java/set-java-home.zsh

. "$HOME/.atuin/bin/env"

eval "$(atuin init zsh)"

export PATH="${ASDF_DATA_DIR:-$HOME/.asdf}/shims:$PATH"
