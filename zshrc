#
# Executes commands at the start of an interactive session.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#

# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

# Source base16 256 colourspace script.
if [[ -s "$HOME/.colours/base16-shell/base16-tomorrow.dark.sh" ]]; then
  source "$HOME/.colours/base16-shell/base16-tomorrow.dark.sh"
fi

# Load direnv
if which direnv > /dev/null; then eval "$(direnv hook zsh)"; fi

# Setup docker environment variables docker-machine
# if which docker-machine > /dev/null; then
#   eval "$(docker-machine env dev)";
# fi

# Aliases
unalias gb

alias a='tmux attach -t'
alias g='git'
alias v='vim'
alias t='tmux'
alias z='zeus'
alias s='spring'
alias be='bundle exec'
alias psql.server='pg_ctl -D /usr/local/var/postgres -l /usr/local/var/postgres/server.log'
alias gt='go test -v -cover ./...'
alias gru='git remote update'
alias tk='tmux kill-session -t'
alias rt='rubocop -R -a && rspec spec'
alias et='ember test'
alias kpg='rm /usr/local/var/postgres/postmaster.pid'
alias rdb='rake db:migrate && rake db:test:prepare && rake db:seed RAILS_ENV=test'
alias emberupdate='bower cache clean && npm cache clean && rm -rf bower_components node_modules dist tmp && bower install && npm install'
alias syncdb='JOBS=4 rake db:clear db:sync'
alias lsaws-s='cd ~/Code/chef-repo/ && rake aws:instances && cd -'
alias lsaws-p='cd ~/Code/chef-repo/ && ENVIRONMENT=production rake aws:instances  && cd -'
alias gprunelocal='git branch --merged | grep -v "\*" | grep -v "master" | grep -v "develop" | grep -v "staging" | xargs -n 1 git branch -d'

if which direnv > /dev/null; then eval "$(direnv hook zsh)"; fi
source /Users/Allen/.iterm2_shell_integration.zsh
