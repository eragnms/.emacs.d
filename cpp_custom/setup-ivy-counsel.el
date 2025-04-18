;; Ivy manual, version 0.13.0. Ivy is an interactive interface for completion
;; in Emacs.
;; Emacs uses completion mechanism in a variety of contexts: code, menus,
;; commands, variables, functions, etc.
(use-package ivy
  :init
  (progn
    (ivy-mode 1)
    (setq ivy-use-virtual-buffers t)
    (global-set-key (kbd "C-c s") 'swiper)))

(use-package counsel
  :bind
  (("M-x" . counsel-M-x)
   ("M-y" . counsel-yank-pop)
   ("C-c r" . counsel-recentf)
   ("C-x C-f" . counsel-find-file)
   ("<f1> f" . counsel-describe-function)
   ("<f1> v" . counsel-describe-variable)
   ("<f1> l" . counsel-load-library)
   ("C-h f" . counsel-describe-function)
   ("C-h v" . counsel-describe-variable)
   ("C-h l" . counsel-load-library)))

(use-package counsel-projectile
  :init
  (counsel-projectile-mode))

(provide 'setup-ivy-counsel)
