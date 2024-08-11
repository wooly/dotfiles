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

alias a='tmux attach -t'
alias g='git'
alias vim='nvim'
alias bx='bundle exec'
alias k='kubectl'

alias kconfig='f() { export KUBECONFIG=~/.kube/kubeconfig_$1 };f'
alias nuke='git remote prune origin && g branch -vv | grep "\[origin/.*: gone]" | tr -s " " | cut -d" " -f 2 | xargs git branch -d'
alias popr='git rev-parse --abbrev-ref HEAD | xargs git push -u origin 2>&1 | grep -o "https://.*pull.*" | xargs open'
alias ug="git commit -am 'All hail eslint, king of the linters'"
alias cq='f() { cd ~/version-control/colloquial/$1 };f'
alias pairer='ssh -f -N -T -R22222:localhost:22 steve@bastion'
alias pairee='ssh -f -N -T -L 22222:localhost:22222 steve@bastion'

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
[ -x "$(command -v kubectl)" ] && source <(kubectl completion zsh)

export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$GEM_HOME/bin:$PATH"
export BUNDLER_EDITOR=nvim

. $HOME/.asdf/asdf.sh
