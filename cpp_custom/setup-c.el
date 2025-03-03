;; hs-minor-mode for folding source code
(add-hook 'c++-mode-hook 'hs-minor-mode)

;; Available C style:
;; “gnu”: The default style for GNU projects
;; “k&r”: What Kernighan and Ritchie, the authors of C used in their book
;; “bsd”: What BSD developers use, aka “Allman style” after Eric Allman.
;; “whitesmith”: Popularized by the examples that came with Whitesmiths C, an early commercial C compiler.
;; “stroustrup”: What Stroustrup, the author of C++ used in his book
;; “ellemtel”: Popular C++ coding standards as defined by “Programming in C++, Rules and Recommendations,” Erik Nyquist and Mats Henricson, Ellemtel
;; “linux”: What the Linux developers use for kernel development
;; “python”: What Python developers use for extension modules
;; “java”: The default style for java-mode (see below)
;; “user”: When you want to define your own style
;;(setq c-default-style) "linux" ;; set style to "linux"
;;(setq c-default-style "linux")
(setq c-default-style "linux"
      c-basic-offset 4)

;;(use-package cc-mode
;;  :init
;;  (define-key c-mode-map  [(tab)] 'company-complete)
;;  (define-key c++-mode-map  [(tab)] 'company-complete))

(provide 'setup-c)

;; Added by mats

;; Toggle hide block
(bind-key "C-c h" 'hs-toggle-hiding)

;; Mark too long lines
(require 'whitespace)

(add-hook 'c-mode-hook
          (function (lambda ()
                      (whitespace-mode t))))
(add-hook 'c++-mode-hook
          (function (lambda ()
                      (whitespace-mode t))))
(setq whitespace-line-column 80) ;; limit line length
(setq whitespace-style '(face lines-tail))
