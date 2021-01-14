;; evil
(use-package evil
  :ensure t
  :config
  ;; remove all keybindings from insert-state keymap,it is VERY VERY important
  (setcdr evil-insert-state-map nil)

  ;; but [escape] should switch back to normal state
  (define-key minibuffer-local-ns-map [escape] 'minibuffer-keyboard-quit)
  (define-key minibuffer-local-completion-map [escape] 'minibuffer-keyboard-quit)
  (define-key minibuffer-local-must-match-map [escape] 'minibuffer-keyboard-quit)
  (define-key minibuffer-local-map [escape] 'minibuffer-keyboard-quit)
  (define-key minibuffer-local-isearch-map [escape] 'minibuffer-keyboard-quit)
  (define-key evil-normal-state-map [escape] 'keyboard-quit)
  (define-key evil-normal-state-map "U" #'undo-tree-visualize)
  (define-key evil-insert-state-map [escape] 'evil-normal-state)
  (define-key evil-visual-state-map [escape] 'keyboard-quit)
  (define-key evil-emacs-state-map [escape] 'evil-normal-state)
  (define-key evil-motion-state-map [escape] 'evil-normal-state)
  (define-key evil-operator-state-map [escape] 'evil-normal-state)

  (define-key evil-insert-state-map (read-kbd-macro evil-toggle-key) 'evil-emacs-state)
  (define-key evil-normal-state-map (kbd "K") (kbd "5k"))
  (define-key evil-normal-state-map (kbd "J") (kbd "5j"))
  (define-key evil-normal-state-map (kbd "H") (kbd "b"))
  (define-key evil-normal-state-map (kbd "L") (kbd "w"))
  (define-key evil-normal-state-map (kbd "C-h") (kbd "^"))
  (define-key evil-normal-state-map (kbd "C-l") (kbd "$"))
  (define-key evil-normal-state-map (kbd "w") 'save-buffer)
  (define-key evil-normal-state-map (kbd "W") 'save-buffer)

  (global-set-key [escape] 'evil-exit-emacs-state)

  (evil-define-key 'normal help-mode-map
    "q" 'quit-window)
  (evil-define-key 'normal helpful-mode-map
    "q" 'quit-window))
(evil-mode t)

;; evil-leader
(use-package evil-leader
  :init
  (global-evil-leader-mode)
  :config
  (evil-leader/set-leader "<SPC>")
  (evil-leader/set-key
    "SPC" 'counsel-M-x

    "1"   'winum-select-window-1
    "2"   'winum-select-window-2
    "3"   'winum-select-window-3
    "4"   'winum-select-window-4
    "5"   'winum-select-window-5
    "6"   'winum-select-window-6
    "7"   'winum-select-window-7
    "8"   'winum-select-window-8
    "9"   'winum-select-window-9
    "0"   'treemacs-select-window

    "atl" 'global-command-log-mode
    "ayl" 'ein:notebooklist-login
    "ayo" 'ein:notebooklist-open
    "ayr" 'ein:run
    "ays" 'ein:stop
    "aoo" 'org-agenda
    "aoa" 'org-agenda-list
    "aoc" 'org-capture
    "aot" 'org-todo-list
    "am"  'wl
    "aojj" 'org-journal-new-entry
    "aojs" 'org-journal-search-forever
    "aojt" 'org-journal-new-scheduled-entry
    "aojv" 'org-journal-schedule-view

    "bb"  'ivy-switch-buffer
    "bd"  'kill-this-buffer
    "bm"  'bookmark-set
    "bj"  'bookmark-jump
    "bI"  'ibuffer
    "bp"  'previous-buffer
    "bn"  'next-buffer
    "bt"  'imenu-list-smart-toggle
    "bs"  'switch-to-scratch-buffer

    "ff"  'counsel-find-file
    "fj"  'dired-jump
    "fCd" 'unix2dos
    "fCu" 'dos2unix
    "fE"  'sudo-edit
    "fd"  'delete-this-file
    "ft"  'treemacs
    "fo"  'open-file-or-directory-in-external-app
    "fr"  'counsel-recentf
    "fR"  'rename-this-file
    "fs"  'save-buffer
    "fa"  'save-some-buffers
    "fyy" 'copy-file-name

    "Fb"  'switch-to-buffer-other-frame
    "FB"  'display-buffer-other-frame
    "Fd"  'delete-frame
    "FD"  'delete-other-frames
    "Fn"  'make-frame
    "Fo"  'other-frame
    "FO"  'dired-other-frame
    "Ff"  'find-file-other-frame

    "gs"  'magit-status
    "gt"  'git-timemachine
    "gb"  'magit-blame
    "gp"  'git-messenger:popup-message

    "hf"  'describe-function
    "hk"  'describe-key
    "hv"  'describe-variable
    "hp"  'describe-package

    "nf"  'narrow-to-defun
    "np"  'narrow-to-page
    "nr"  'narrow-to-region
    "nw"  'widen

    ;; Project
    "pb"  'projectile-switch-to-buffer
    "pc"  'projectile-compile-project
    "pd"  'projectile-find-dir
    "pe"  'projectile-edit-dir-locals
    "pf"  'projectile-find-file
    "pg"  'projectile-find-tag
    "pk"  'projectile-kill-buffers
    "pp"  'projectile-switch-project
    "pr"  'projectile-recentf
    "pR"  'projectile-replace
    "ps"  'projectile-switch-project
    "pv"  'projectile-vc
    "px"  'projectile-remove-known-project
    "pz"  'projectile-cache-current-file

    "Pc"  'password-store-copy
    "Pg"  'password-store-generate
    "Pr"  'password-store-remove
    "Pe"  'password-store-edit
    "PR"  'password-store-rename
    "Pi"  'password-store-insert
    "Pu"  'password-store-url

    "sa"  'mark-whole-buffer
    "sp"  'projectile-ripgrep
    "ss"  'swiper
    "sn"  'snails

    "te"  'toggle-company-english-helper
    "tg"  'go-translate
    "tp"  'go-translate-popup
    "tt"  'insert-translated-name-insert
    "tl"  'toggle-truncate-lines
    "tw"  'toggle-frame-maximized
    "tf"  'toggle-frame-fullscreen
    "th"  'english-teacher-follow-mode

    "ww"  'other-window
    "wm"  'toggle-maximize-buffer
    "wo"  'other-frame
    "w/"  'split-window-right
    "w-"  'split-window-below
    "wd"  'delete-window
    "w="  'balance-windows
    "wh"  'evil-window-left
    "wH"  'evil-window-move-far-left
    "wl"  'evil-window-right
    "wL"  'evil-window-move-far-right
    "wj"  'evil-window-down
    "wJ"  'evil-window-move-very-bottom
    "wk"  'evil-window-up
    "wK"  'evil-window-move-very-top

    "v"   'er/expand-region

    "xu"  'downcase-region
    "xU"  'upcase-region
    "u"   'downcase-word
    "U"   'upcase-word

    "yp"  'youdao-dictionary-search-at-point-posframe
    "yi"  'youdao-dictionary-search-from-input
    "yv"  'youdao-dictionary-play-voice-at-point
    "ys"  'youdao-dictionary-play-voice-from-input

    "qq"  'save-buffers-kill-terminal

    "     '" 'shell-pop
    "TAB" 'switch-to-prev-buffer))
