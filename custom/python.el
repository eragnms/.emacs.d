;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Python
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Install elpy
;; - restart emacs
;; - M-x eval-buffer
;; - M-x package-refresh-contents
;; - M-x package-install RET elpy RET
:init (with-eval-after-load 'python 
      (elpy-enable)
      (delete `elpy-module-highlight-indentation elpy-modules)
      (setq elpy-rpc-timeout 10)
      (defalias 'workon 'pyvenv-workon)

      ;; Check syntax on the fly, does not seem to work?
      (when (require 'flycheck nil t)
        (setq elpy-modules (delq 'elpy-module-flymake elpy-modules))
        (add-hook 'elpy-mode-hook 'flycheck-mode))

      (require 'py-autopep8)
      (add-hook 'elpy-mode-hook 'py-autopep8-enable-on-save))
