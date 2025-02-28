;; Lanugage Server Protocol (LSP)
;; Installation:
;; - $ sudo pacman -S clang
;; - $ pip install scan-build
;; - $ pip install "ptvsd>=4.2"
;; To build compilation database for clang, use scan-build: $ intercept-build <make command>.
;; This will generate a "compile_commands.json" file where run.
;;
;; To invoke LSP functions: C-c l
;;
;; References:
;; https://www.taingram.org/blog/emacs-lsp-ide.html
;; https://github.com/emacs-lsp/lsp-mode
;; https://emacs-lsp.github.io/lsp-mode/tutorials/CPP-guide/
;; https://github.com/emacs-lsp/dap-mode
;;
;; TODO:
;; - Test debugger

(use-package lsp-mode
  :init
  ;; set prefix for lsp-command-keymap (few alternatives - "C-l", "C-c l")
  (setq lsp-keymap-prefix "C-c l")
  :hook (;; replace XXX-mode with concrete major-mode(e. g. python-mode)
         (python-mode . lsp)
	     (c++-mode . lsp)
	     (c-mode . lsp)
         (typescript-mode . lsp)
         (web-mode . lsp)
         ;; which-key integration
         (lsp-mode . lsp-enable-which-key-integration))
  :commands lsp)

(use-package lsp-ui :commands lsp-ui-mode)
(use-package helm-lsp :commands helm-lsp-workspace-symbol)
(use-package lsp-treemacs :commands lsp-treemacs-errors-list)
(use-package typescript-mode
  :mode "\\.ts[x]?\\'")
(use-package which-key
  :config
  (which-key-mode)
  )

;; sample `helm' configuration use https://github.com/emacs-helm/helm/ for details
(helm-mode)
(require 'helm-xref)
(define-key global-map [remap find-file] #'helm-find-files)
(define-key global-map [remap execute-extended-command] #'helm-M-x)
(define-key global-map [remap switch-to-buffer] #'helm-mini)

;;;;;;;;;;;;;;;;
;; GO setup
;;;;;;;;;;;;;;;;
;; Company mode
(setq company-idle-delay 0)
(setq company-minimum-prefix-length 1)
;; Go - lsp-mode
;; Set up before-save hooks to format buffer and add/delete imports.
(defun lsp-go-install-save-hooks ()
  (add-hook 'before-save-hook #'lsp-format-buffer t t)
  (add-hook 'before-save-hook #'lsp-organize-imports t t))
(add-hook 'go-mode-hook #'lsp-go-install-save-hooks)
;; Start LSP Mode and YASnippet mode
(add-hook 'go-mode-hook #'lsp-deferred)
(add-hook 'go-mode-hook #'yas-minor-mode)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Switching off various lsp-mode features
;; https://emacs-lsp.github.io/lsp-mode/tutorials/how-to-turn-off/
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; Symbol highlighting
;(setq lsp-enable-symbol-highlighting nil)

;; lsp-ui-doc - on hover dialogs. * disable via
(setq lsp-ui-doc-enable nil)

;; disable cursor hover (keep mouse hover)
;(setq lsp-ui-doc-show-with-cursor nil)

;; disable mouse hover (keep cursor hover)
;(setq lsp-ui-doc-show-with-mouse nil)

;; Lenses
; (setq lsp-lens-enable nil)

;; Headerline
;(setq lsp-headerline-breadcrumb-enable nil)

;; Sideline code actions * disable whole sideline via
; (setq lsp-ui-sideline-enable nil)

;; hide code actions
; (setq lsp-ui-sideline-show-code-actions nil)

;; Sideline hover symbols * disable whole sideline via
; (setq lsp-ui-sideline-enable nil)

;; hide only hover symbols
;(setq lsp-ui-sideline-show-hover nil)

;; Modeline code actions
;(setq lsp-modeline-code-actions-enable nil)

;; Flycheck (or flymake if no flycheck is present)
;(setq lsp-diagnostics-provider :none)

;; Sideline diagnostics * disable whole sideline via
;(setq lsp-ui-sideline-enable nil)

;; hide only errors
;(setq lsp-ui-sideline-show-diagnostics nil)

;; Eldoc
;(setq lsp-eldoc-enable-hover nil)

;; Modeline diagnostics statistics
;(setq lsp-modeline-diagnostics-enable nil)

;; Signature help
;(setq lsp-signature-auto-activate nil) ;; you could manually request them via `lsp-signature-activate`

;; Signature help documentation (keep the signatures)
;(setq lsp-signature-render-documentation nil)

;; Completion (company-mode)
;(setq lsp-completion-provider :none)

;; Completion item detail
;(setq lsp-completion-show-detail nil)

;; Completion item kind
;(setq lsp-completion-show-kind nil)
