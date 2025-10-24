# Aliases
# Use neovim for vim if present.
if command -v neovide >/dev/null; then
  alias vi="neovide" vim="neovide" vimdiff="neovide -d"
elif command -v nvim >/dev/null; then
  alias vi="nvim" vim="nvim" vimdiff="nvim -d"
fi

# main
alias wget="wget --hsts-file=${XDG_CACHE_HOME:-$HOME/.cache}/.wget-hsts"
alias ls="ls --color -X"
alias mt="mutt"
alias os="neofetch"
alias lg="lazygit"
alias ra="ranger"
if command -v yazi >/dev/null; then
  alias ra="yazi" yz="yazi"
fi

# npm
alias mynpm="npm --registry=https://registry.npmmirror.com"
alias npmil="mynpm install"
alias npmul="mynpm uninstall"
alias npmll="mynpm list --depth=0"
alias npmig="mynpm install --location=global"
alias npmug="mynpm uninstall --location=global"
alias npmlg="mynpm list --location=global --depth=0"

# git
alias push="git push origin "$(git_current_branch)""
alias pull="git pull origin "$(git_current_branch)""
alias ppsh="pull;push"
