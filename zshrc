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
# if [[ -s "$HOME/.colours/base16-shell/base16-tomorrow.dark.sh" ]]; then
#   source "$HOME/.colours/base16-shell/base16-tomorrow.dark.sh"
# fi

# Aliases
alias a='tmux attach -t'
alias g='git'
alias v='vim'
# alias n='NVIM_TUI_ENABLE_TRUE_COLOR=1 nvim'
alias t='tmux'
alias c='cd'
alias z='zeus'
alias s='spring'
alias be='bundle exec'
alias psql.server='pg_ctl -D /usr/local/var/postgres -l /usr/local/var/postgres/server.log'
alias gt='go test -v -cover ./...'
