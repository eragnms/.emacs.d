;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Python
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Elpy
(use-package elpy
  :ensure t
  :config
  (if (executable-find "python3")
      (progn
        (setq elpy-rpc-python-command "python3")
        (setq python-shell-interpreter "python3")))

  (use-package pyvenv
    :ensure t
    :config
    (pyvenv-workon "dotfiles"))

  (use-package jedi
    :ensure t)

  ;; Automatically run Black on buffer save
  (add-hook 'elpy-mode-hook
            '(lambda ()
               (when (eq major-mode 'python-mode)
                 (add-hook 'before-save-hook 'elpy-black-fix-code))))

  ;; Use flycheck instead of flymake
  (when (require 'flycheck nil t)
    (setq elpy-modules (delq 'elpy-module-flymake elpy-modules))
    (add-hook 'elpy-mode-hook 'flycheck-mode))

  (elpy-enable)

  (setq elpy-rpc-backend "jedi"))

;; isort
;;(add-to-list 'load-path "/your/path/")
(require 'py-isort)
(add-hook 'before-save-hook 'py-isort-before-save)
