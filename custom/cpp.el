;; This mode is mainly based on https://tuhdo.github.io/c-ide.html

(setq use-package-always-ensure t)

(add-to-list 'load-path "~/.emacs.d/cpp_custom")

(require 'setup-general)
(if (version< emacs-version "24.4")
    (require 'setup-ivy-counsel)
    (require 'setup-helm)
    (require 'setup-helm-gtags))
    ;;(require 'setup-ggtags)
(require 'setup-cedet)
(require 'setup-editing)

;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; My additions to Tuhdo
;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Compile: compile-parent lets you compile at a folder level of choice
(defun compile-parent (command)
  (interactive
   (let* ((make-directory (locate-dominating-file (buffer-file-name)
                                                  "Makefile"))
          (command (concat "make -k -C "
                           (shell-quote-argument make-directory))))
     (list (compilation-read-command command))))
  (compile command))

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
