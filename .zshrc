source ~/etc/antigen/antigen.zsh

antigen use oh-my-zsh

antigen bundle git
antigen bundle ruby
antigen bundle rails
antigen bundle git-flow
antigen bundle heroku
antigen bundle pip
antigen bundle docker
antigen bundle vagrant
antigen bundle command-not-found

antigen bundle zsh-users/zsh-syntax-highlighting
antigen bundle zsh-users/zsh-autosuggestions
antigen bundle zsh-users/zsh-history-substring-search

antigen theme robbyrussell

antigen apply

alias vs="vagrant ssh"
alias vp="vagrant provision"
alias vu="vagrant up"
alias vh="vagrant halt"
alias json-pretty="python -m json.tool"
alias sbtenv="env \$(cat .env | grep \"^\s*[^#]\" | xargs) sbt"
alias berc="bundle exec rails console"
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
