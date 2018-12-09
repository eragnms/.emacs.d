;; This mode is mainly based on https://tuhdo.github.io/c-ide.html

(setq use-package-always-ensure t)

(add-to-list 'load-path "~/.emacs.d/cpp_custom")

(require 'setup-general)
(require 'setup-projectile)
(if (version< emacs-version "24.4")
    (require 'setup-ivy-counsel)
    (require 'setup-helm)
    (require 'setup-helm-gtags))
;;(require 'setup-ggtags)
(require 'setup-cedet)
(require 'setup-editing)
(require 'setup-c)
(require 'setup-company)



;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; My additions to Tuhdo
;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; srefactor for small scale refactoring
(require 'srefactor)
(require 'srefactor-lisp)
;; OPTIONAL: ADD IT ONLY IF YOU USE C/C++.
(semantic-mode 1) ;; -> this is optional for Lisp
(define-key c-mode-map (kbd "M-RET") 'srefactor-refactor-at-point)
(define-key c++-mode-map (kbd "M-RET") 'srefactor-refactor-at-point)
(global-set-key (kbd "M-RET o") 'srefactor-lisp-one-line)
(global-set-key (kbd "M-RET m") 'srefactor-lisp-format-sexp)
(global-set-key (kbd "M-RET d") 'srefactor-lisp-format-defun)
(global-set-key (kbd "M-RET b") 'srefactor-lisp-format-buffer)
;; Always start smartparens mode in c++-mode.
(add-hook 'c++-mode-hook #'smartparens-mode)
