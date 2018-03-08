;; Swap <Backspace> and <DEL>, to get <Backspace> to work in Terminus, see
;; https://www.gnu.org/software/emacs/manual/html_node/efaq/Backspace-invokes-help.html
(keyboard-translate ?\C-h ?\C-?)

;; Insert new empty line below current line
(defun newline-without-break-of-line ()
  (interactive)
  (end-of-line)
  (open-line 1)
  (right-char))
(global-set-key (kbd "C-o") 'newline-without-break-of-line)

;; Goto beginning and end of line
(global-set-key (kbd "C-e") (lambda () (interactive)(beginning-of-line)))
(global-set-key (kbd "M-E") (lambda () (interactive)(end-of-line)))

;; Enable hideshow minor mode
(defun my-hide-all()
  (interactive)
  (hs-minor-mode)
  ;(hs-hide-all)
  )
(add-hook 'prog-mode-hook 'my-hide-all)

;; kill whole line
(defun my-kill-whole-line()
  (interactive)
  (kill-whole-line))
(global-set-key (kbd "M-n") 'my-kill-whole-line)

;; In shell mode cycle through previous commands
(global-set-key (kbd "C-x p") 'comint-previous-input)

;; Insert spaces instead of tabs
;(setq-default indent-tabs-mode nil)

;; Bindings for org-mode
(global-set-key "\C-cl" 'org-store-link)
(global-set-key "\C-ca" 'org-agenda)
(global-set-key "\C-cc" 'org-capture)
(global-set-key "\C-cb" 'org-iswitchb)


