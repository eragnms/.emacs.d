;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Setting up packages and their sources.
;; See the answer from jpkotta here:
;; https://stackoverflow.com/questions/14836958/updating-packages-in-emacs
;; Later changed to what is described here:
;; https://realpython.com/blog/python/emacs-the-best-python-editor/
;; Later changed to:
;; https://stackoverflow.com/questions/10092322/how-to-automatically-install-emacs-packages-by-specifying-a-list-of-package-name
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Get rid of warning for depricated cl package
(setq byte-compile-warnings '(cl-functions))

;; List the packages we want to have installed
(setq package-list '( anzu
                      flx-ido
                      auto-package-update
                      company
                      flycheck
                      wgrep
                      iedit
                      better-defaults
                      py-autopep8
                      function-args
                      sr-speedbar
		      magit
		      markdown-mode
		      company-c-headers
		      srefactor
		      smartparens
                      free-keys
                      bind-key
                      undo-tree
                      clean-aindent-mode
                      dtrt-indent
                      ws-butler
                      which-key
                      ghub
                      treepy
                      graphql
                      zygospore
		      projectile
                      use-package
                      volatile-highlights
                      zenburn-theme
                      hc-zenburn-theme
                      spacemacs-theme
                      writegood-mode
                      lsp-mode
		      yasnippet
		      lsp-treemacs
		      hydra
		      avy
		      dap-mode
		      lsp-python-ms
		      lsp-ui
		      eglot
              counsel
              counsel-projectile
              htmlize
              go-mode
	   	      elpy
          helm
          helm-xref
          helm-lsp
          helm-gtags
          helm-projectile
          dockerfile-mode
          gptel
          dash
          s
          editorconfig
          all-the-icons
          json-mode
             org-bullets
              org
              org-analyzer
              web-mode
              typescript-mode
              ))



;; List the repositories containing them
(require 'package)
(add-to-list 'package-archives '("gnu" . "https://elpa.gnu.org/packages/") t)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(add-to-list 'package-archives '("nongnu" . "https://elpa.nongnu.org/nongnu/") t)
;; In case we need to access old org archives use below repos
;(add-to-list 'package-archives '("org" . "http://orgmode.org/elpa/") t)

;; fetch the list of packages available
(unless package-archive-contents
  (package-refresh-contents))

;; install the missing packages
(dolist (package package-list)
  (unless (package-installed-p package)
    (package-install package)))
