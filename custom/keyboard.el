;; free-keys package, gives a function of the same name that shows you all your currently unused key-bindings.
;; bind-key gives a cleaner syntax for defining your own bindings, i.e.:
;; (bind-key "C-h C-k" 'free-keys)
;; bind-key also comes with a handy defun called describe-personal-keybindings
;; to see all the key-bindings you've set as well as if and what bindings you've overridden.

;; Swap <Backspace> and <DEL>, to get <Backspace> to work in Terminus, see
;; https://www.gnu.org/software/emacs/manual/html_node/efaq/Backspace-invokes-help.html
(keyboard-translate ?\C-h ?\C-?)

;; Add another way of doing M-x
(bind-key "C-c x" 'execute-extended-command)

;; Insert new empty line below current line
(defun newline-without-break-of-line ()
  (interactive)
  (end-of-line)
  (open-line 1)
  (right-char))
(global-set-key (kbd "C-o") 'newline-without-break-of-line)

;; Goto beginning and end of line
(bind-key "C-c q" 'beginning-of-line)
(bind-key "C-c e" 'end-of-line)

;; kill whole line
(defun my-kill-whole-line()
  (interactive)
  (kill-whole-line))
(global-set-key (kbd "M-n") 'my-kill-whole-line)

;; In shell mode cycle through previous commands
(global-set-key (kbd "C-x p") 'comint-previous-input)

;; Turn autoindenting on
(global-set-key "\r" 'newline-and-indent)

;; Scroll up
(bind-key "C-c v" 'scroll-down-command)

