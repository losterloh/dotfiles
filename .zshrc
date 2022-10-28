source ~/etc/antigen/antigen.zsh

antigen use oh-my-zsh

antigen bundle git
antigen bundle heroku
antigen bundle pip
antigen bundle command-not-found

antigen bundle zsh-users/zsh-syntax-highlighting
antigen bundle zsh-users/zsh-autosuggestions
antigen bundle zsh-users/zsh-history-substring-search

antigen bundle jocelynmallon/zshmarks

antigen bundle kiurchv/asdf.plugin.zsh

antigen theme robbyrussell

antigen apply

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

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

alias G="jump"
alias S="bookmark"
alias D="deletemark"
alias P="showmarks"
alias L="showmarks"

export PATH="/Users/lukas/.local/bin:$PATH"

alias ac='source $(poetry env info -p)/bin/activate'

# we need this so we can set the prompt when sourcing via direnv, see https://github.com/direnv/direnv/issues/268
setopt PROMPT_SUBST
show_virtual_env() {
  if [[ -n "$VIRTUAL_ENV" && -n "$DIRENV_DIR" ]]; then
    echo "($(basename $VIRTUAL_ENV))"
  fi
}
PS1='$(show_virtual_env)'$PS1

PATH="/Applications/Postgres.app/Contents/Versions/latest/bin:$PATH"

# see https://stackoverflow.com/questions/72163907/unable-to-install-confluent-kafka-fatal-error-librdkafka-rdkafka-h-no-such-f
export C_INCLUDE_PATH=/opt/homebrew/Cellar/librdkafka/1.9.2/include
export LIBRARY_PATH=/opt/homebrew/Cellar/librdkafka/1.9.2/lib
