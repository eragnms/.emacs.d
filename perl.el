;; Use cperl-mode instead of the default perl-mode
(mapc
     (lambda (pair)
       (if (eq (cdr pair) 'perl-mode)
           (setcdr pair 'cperl-mode)))
     (append auto-mode-alist interpreter-mode-alist))

;; Turn autoindenting on
(global-set-key "\r" 'newline-and-indent)

;; Disable indication of whitespaces
(setq cperl-invalid-face nil)

;; Expands for keywords such as foreach, while, etc...
(setq cperl-electric-keywords t) 

;; Short cuts
(global-set-key "\M-d" 'perldb) ; Start debugger on ESC-d

(add-hook 'cperl-mode-hook
  '(lambda () (auto-fill-mode 1)))
