#
# Executes commands at the start of an interactive session.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#

export ASDF_DIR=$(brew --prefix asdf)
export WORKON_HOME=~/.virtualenvs
export PIP_VIRTUALENV_BASE=$WORKON_HOME
export PIP_RESPECT_VIRTUALENV=true
export PYENV_ROOT=~/.pyenv

eval "$(pyenv init -)"

# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

# Source base16 256 colourspace script.
if [[ -s "$HOME/.colours/base16-shell/scripts/base16-tomorrow-night.sh" ]]; then
  source "$HOME/.colours/base16-shell/scripts/base16-tomorrow-night.sh"
fi

# Load direnv
if which direnv > /dev/null; then eval "$(direnv hook zsh)"; fi

# Setup docker environment variables docker-machine
# if which docker-machine > /dev/null; then
#   eval "$(docker-machine env dev)";
# fi

export PROMPT="%F{blue}%M%f %F{red}❯%f%F{yellow}❯%f%F{green}❯%f %~"$'\n'"%(?.%F{green}❯%f.%F{red}❯%f) "

alias a='tmux attach -t'
alias g='git'
alias v='nvim'
alias n='nvim'
alias vim='nvim'
alias t='tmux'
alias c='cd'
alias z='zeus'
alias s='spring'
alias be='bundle exec'
alias psql.server='pg_ctl -D /usr/local/var/postgres -l /usr/local/var/postgres/server.log'
alias gt='go test -v -cover $(go list ./... | grep -v vendor)'
alias mux='tmuxinator'
alias lsaws-s='cd ~/version-control/chef-repo/ && rake aws:instances && cd -'
alias lsaws-p='cd ~/version-control/chef-repo/ && ENVIRONMENT=production rake aws:instances && cd -'
alias bx='be'
alias emberupdate='bower cache clean && npm cache clean && rm -rf bower_components && rm -rf node_modules && bower install && npm install'
alias rp='bundle exec rake precommit'

alias h='cd ~/version-control/hydrant'
alias intd='cd ~/version-control/integrated-data'
alias intw='cd ~/version-control/integrated-web'
alias setup_tests='be rake db:test:prepare && be rake db:seed RAILS_ENV=test'
alias m='minikube'
alias k='kubectl'

alias dq='f() { curl -X "POST" -H "Content-Type:application/json" -d @$1 "http://localhost:8082/druid/v2/?pretty" };f'
alias di='f() { curl -X "POST" -H "Content-Type:application/json" -d @$1 "http://localhost:8090/druid/indexer/v1/task" };f'

alias kconfig='f() { export KUBECONFIG=~/version-control/kube-config/sydney-$1.config };f'

# Kubectl autocomplete
source <(kubectl completion zsh)
source $(brew --prefix asdf)/asdf.sh
export PATH="/usr/local/opt/postgresql@10/bin:$PATH"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
