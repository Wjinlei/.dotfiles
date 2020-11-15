(use-package evil
  :ensure t

  :init
  (evil-mode t)

  :config
  (define-key evil-normal-state-map (kbd "K") (kbd "5k"))
  (define-key evil-normal-state-map (kbd "J") (kbd "5j"))
  (define-key evil-normal-state-map (kbd "H") (kbd "b"))
  (define-key evil-normal-state-map (kbd "L") (kbd "w"))
  (define-key evil-normal-state-map (kbd "C-h") (kbd "^"))
  (define-key evil-normal-state-map (kbd "C-l") (kbd "$"))
  )
