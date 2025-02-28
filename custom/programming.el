;; show unncessary whitespace that can mess up your diff
(add-hook 'prog-mode-hook
          (lambda () (interactive)
            (setq show-trailing-whitespace 1)))

;; use space to indent by default
(setq-default indent-tabs-mode nil)

;; set appearance of a tab that is represented by 4 spaces
(setq-default tab-width 4)

;; activate whitespace-mode to view all whitespace characters
(global-set-key (kbd "C-c w") 'whitespace-mode)

;; Change keybindings for windmove
; (windmove-default-keybindings)
(windmove-default-keybindings 'control)
; (global-set-key (kbd "C-c <left>")  'windmove-left)
; (global-set-key (kbd "C-c <right>") 'windmove-right)
; (global-set-key (kbd "C-c <up>")    'windmove-up)
; (global-set-key (kbd "C-c <down>")  'windmove-down)

;; Projectile
(projectile-mode +1)
(define-key projectile-mode-map (kbd "C-c p") 'projectile-command-map)

;; flx-ido
(require 'flx-ido)
;; IDO is not compatible with helm, so to get rid of warnings on helm disabling
;; IDO I commented out the IDO start in the two lines below.
;;(ido-mode 1)
;;(ido-everywhere 1)
(flx-ido-mode 1)
;; disable ido faces to see flx highlights.
(setq ido-enable-flex-matching t)
(setq ido-use-faces nil)

;; Package zygospore
;; A simple package for undoing the delete-other-windows command.
;; Convenient for needing more space in one buffer temporarily or
;; not having to worry about losing a specific setup.
(use-package zygospore
  :bind (("C-x 1" . zygospore-toggle-delete-other-windows)
         ("RET" .   newline-and-indent)))

;; Jump within a block and mark block
(bind-key "C-c d" 'forward-sexp)
(bind-key "C-c u" 'backward-sexp)
(bind-key "C-c m" 'mark-sexp)

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

;; Specific language configurations
;; LSP has replaced python.el and cpp.el. Eglot is an alternative
;; to LSP that is not up and running at the momen.
(load-user-file "lsp.el")
;(load-user-file "eglot.el")
;(load-user-file "python.el")
;(load-user-file "cpp.el")
(load-user-file "octave.el")
(load-user-file "perl.el")

;; Debugging
(load-user-file "debug.el")
