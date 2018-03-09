;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Setting up packages and their sources.
;; See the answer from jpkotta here:
;; https://stackoverflow.com/questions/14836958/updating-packages-in-emacs
;; Later changed to what is described here:
;; https://realpython.com/blog/python/emacs-the-best-python-editor/
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(require 'package)

(add-to-list 'package-archives
             '("melpa" . "http://melpa.org/packages/") t)
(add-to-list 'package-archives
             '("org" . "http://orgmode.org/elpa/") t)
(add-to-list 'package-archives
             '("elpy" . "https://jorgenschaefer.github.io/packages/") t)

;; install any packages in myPackages, if they are not installed already
(package-initialize)
(when (not package-archive-contents)
    (package-refresh-contents))

(unless (package-installed-p 'use-package)
  (package-install 'use-package))

(defvar myPackages
  '(elpy
    flycheck
    wgrep
    iedit
    better-defaults
    py-autopep8
    org
    helm
    helm-gtags
    helm-projectile
    function-args
    sr-speedbar))

(mapc #'(lambda (package)
    (unless (package-installed-p package)
      (package-install package)))
      myPackages)
