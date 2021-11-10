# Aliases
# Use neovim for vim if present.
command -v nvim >/dev/null && alias vi="nvim" vim="nvim" vimdiff="nvim -d"

# main
alias ra="ranger"
alias lg="lazygit"
alias mt="neomutt"
alias mu="ncmpcpp"
alias os="neofetch"

# npm
alias npm="npm --registry=https://registry.npm.taobao.org"
alias npmi="npm install"
alias npmu="npm uninstall"
alias npmig="npm install -g"
alias npmug="npm uninstall -g"
alias npml="npm list --depth=0"
alias npmlg="npm list -g --depth=0"
alias ls='ls --color=tty -X'
