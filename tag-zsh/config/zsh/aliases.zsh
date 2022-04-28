# Aliases
# Use neovim for vim if present.
command -v nvim >/dev/null && alias vi="nvim" vim="nvim" vimdiff="nvim -d"

# main
alias ls='ls --color=tty -X'
alias os="neofetch"
alias ra="ranger"
alias lg="lazygit"
alias mt="neomutt"
alias mu="ncmpcpp"

# npm
alias tbnpm="npm --registry=https://registry.npm.taobao.org"
alias npmil="tbnpm install"
alias npmul="tbnpm uninstall"
alias npmll="tbnpm list --depth=0"
alias npmig="tbnpm install -g"
alias npmug="tbnpm uninstall -g"
alias npmlg="tbnpm list -g --depth=0"
