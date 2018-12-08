;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Setting up packages and their sources.
;; See the answer from jpkotta here:
;; https://stackoverflow.com/questions/14836958/updating-packages-in-emacs
;; Later changed to what is described here:
;; https://realpython.com/blog/python/emacs-the-best-python-editor/
;; Later changed to:
;; https://stackoverflow.com/questions/10092322/how-to-automatically-install-emacs-packages-by-specifying-a-list-of-package-name
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; List the packages we want to have installed
(setq package-list '(use-package
		             elpy
                     flycheck
                     wgrep
                     iedit
                     better-defaults
                     py-autopep8
                     org
                     helm
                     helm-gtags
                     helm-projectile
                     projectile
                     function-args
                     sr-speedbar
		             magit
		             markdown-mode
		             company-c-headers
		             srefactor
		             smartparens
                     free-keys
                     bind-key
                     volatile-highlights
                     undo-tree
                     clean-aindent-mode
                     dtrt-indent
                     ws-butler
                     anzu
                     flx-ido
                     auto-package-update
		             company
                     which-key
                     org-bullets
                     ghub
                     magit-p4
                     treepy
                     graphql
                     zygospore))

;; List the repositories containing them
(require 'package)
(add-to-list 'package-archives '("gnu" . "https://elpa.gnu.org/packages/") t)
;;(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(add-to-list 'package-archives '("melpa-stable" . "https://stable.melpa.org/packages/") t)
(add-to-list 'package-archives '("org" . "http://orgmode.org/elpa/") t)
;;(add-to-list 'package-archives '("elpy" . "https://jorgenschaefer.github.io/packages") t)

;; activate all the packages (in particular autoloads)
(package-initialize)

;; fetch the list of packages available
(unless package-archive-contents
  (package-refresh-contents))

;; install the missing packages
(dolist (package package-list)
  (unless (package-installed-p package)
    (package-install package)))
