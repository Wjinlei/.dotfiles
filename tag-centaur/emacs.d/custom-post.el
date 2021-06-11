;; init-evil.el

;;; Code:
(use-package evil
  :demand t ; https://github.com/noctuid/general.el/issues/180
  :hook (after-init . evil-mode)
  :init
  (setq evil-magic t
        evil-echo-state t
        evil-default-state 'normal
        evil-want-C-u-scroll t
        evil-want-C-w-delete t
        evil-want-Y-yank-to-eol t
        evil-want-integration t
        evil-want-keybinding nil
        evil-want-visual-char-semi-exclusive t
        evil-indent-convert-tabs t
        evil-ex-search-vim-style-regexp t
        evil-ex-substitute-global t
        evil-ex-visual-char-range t  ; column range for ex commands
        evil-insert-skip-empty-lines t
        evil-disable-insert-state-bindings t ; enable default emacs keybinding in insert state
        evil-symbol-word-search t ;; more vim-like behavior
        ;; don't activate mark on shift-click
        shift-select-mode nil
        evil-cross-lines t
        evil-move-cursor-back t ;; move back the cursor one position when exiting insert mode
        evil-esc-delay 0.01
        evil-mode-line-format 'after)
  ;; cursor appearance
  (setq evil-default-cursor '(box (lambda () (evil-set-cursor-color my-default-cursor-color)))
        evil-normal-state-cursor 'box
        evil-emacs-state-cursor  '(hbar (lambda () (evil-set-cursor-color my-emacs-cursor-color)))
        evil-insert-state-cursor '(bar . 2)
        evil-visual-state-cursor 'box)
  :config
  (evil-mode)
  (evil-set-initial-state 'dired-mode 'emacs)
  (evil-set-initial-state 'vterm-mode 'emacs)
  (define-key evil-insert-state-map (kbd "jj") 'evil-normal-state)
  (define-key evil-normal-state-map (kbd "K") (kbd "5k"))
  (define-key evil-normal-state-map (kbd "J") (kbd "5j"))
  (define-key evil-normal-state-map (kbd "H") 'evil-backward-word-begin)
  (define-key evil-normal-state-map (kbd "L") 'evil-forward-word-begin)
  (define-key evil-normal-state-map (kbd "q") 'quit-window)
  (define-key evil-normal-state-map (kbd "Q") 'quit-window)
  (define-key evil-normal-state-map (kbd "w") 'save-buffer)
  (define-key evil-normal-state-map (kbd "W") 'save-buffer)
  (define-key evil-normal-state-map (kbd "C-k") 'evil-goto-first-line)
  (define-key evil-normal-state-map (kbd "C-j") 'evil-goto-line)
  (define-key evil-normal-state-map (kbd "C-h") 'evil-first-non-blank)
  (define-key evil-normal-state-map (kbd "C-l") 'evil-end-of-line))

(use-package evil-leader
  :ensure t
  :config
  (setq evil-leader/in-all-states 1)
  (evil-leader/set-leader "<SPC>")
  (evil-leader/set-key
    "/"  'vterm
    "lg" 'magit
    "kb" 'kill-buffer
    "ff" 'find-file
    "fr" 'counsel-recentf
    "fd" 'counsel-dired
    "bb" 'ido-switch-buffer))
(global-evil-leader-mode)

(provide 'init-evil)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; init-highlight.el ends here
