;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
;(package-initialize)

(defconst user-init-dir  "~/.emacs.d/custom/")

(defun load-user-file (file)
  (interactive "f")
  "Load a file in current user's configuration directory"
  (load-file (expand-file-name file user-init-dir)))

(load-user-file "packages.el")
(load-user-file "apperance.el")
(load-user-file "python.el")
(load-user-file "keyboard.el")
(load-user-file "markdown.el")
(load-user-file "restructured.el")
(load-user-file "latex.el")
(load-user-file "perl.el")
(load-user-file "gnu_plot.el")
(load-user-file "octave.el")
(load-user-file "org.el")
(load-user-file "cpp.el")
(load-user-file "magit.el")

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   (quote
    (smartparens smartparens-config srefactor company-c-headers magit wgrep use-package sr-speedbar py-autopep8 org iedit helm-projectile helm-gtags function-args flycheck elpy better-defaults)))
 '(safe-local-variable-values
   (quote
    ((company-clang-arguments "-I/home/mats/gitdev/cellscan-tabor-wcdma/wcdma_scanner/include/" "-I/home/mats/gitdev/cellscan-tabor-wcdma/example/include"))))
 '(semantic-mode t))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
