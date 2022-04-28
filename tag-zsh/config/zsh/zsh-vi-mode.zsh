function zvm_config() {
  ZVM_LINE_INIT_MODE=$ZVM_MODE_INSERT
  ZVM_LAZY_KEYBINDINGS=true
  ZVM_VI_INSERT_ESCAPE_BINDKEY=jj
}

function zvm_after_init() {
  bindkey "," autosuggest-accept
  [ -f ~/.config/zsh/p10k.zsh ] && source ~/.config/zsh/p10k.zsh
  [ -f ~/.config/zsh/aliases.zsh ] && source ~/.config/zsh/aliases.zsh
}

function zvm_after_lazy_keybindings() {
  # normal keybinds
  bindkey -M vicmd '^h' vi-first-non-blank
  bindkey -M vicmd '^l' vi-end-of-line

  # insert keybinds
  #bindkey -M viins '^h' vi-first-non-blank
  #bindkey -M viins '^l' vi-end-of-line

  # visual keybinds
  bindkey -M visual '^h' vi-first-non-blank
  bindkey -M visual '^l' vi-end-of-line
}
