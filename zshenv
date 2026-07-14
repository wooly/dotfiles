#
# Defines environment variables.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#

# Ensure that a non-login, non-interactive shell has a defined environment.
if [[ "$SHLVL" -eq 1 && ! -o LOGIN && -s "${ZDOTDIR:-$HOME}/.zprofile" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprofile"
fi

# Put mise's tool shims on PATH for ALL shells, including non-interactive ones
# (editor/agent subshells, git hooks). `mise activate` in ~/.zshrc only runs for
# interactive shells, so non-interactive shells need the shims added here.
export PATH="$HOME/.local/share/mise/shims:$PATH"
