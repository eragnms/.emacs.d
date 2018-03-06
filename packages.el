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

;; install any packages in mg-packages, if they are not installed already
(package-initialize)
(when (not package-archive-contents)
    (package-refresh-contents))

(defvar myPackages
  '(elpy
    flycheck
    wgrep
    iedit
    better-defaults
    py-autopep8))

(mapc #'(lambda (package)
    (unless (package-installed-p package)
      (package-install package)))
      myPackages)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; GNU Plot
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; move the files gnuplot.el to someplace in your lisp load-path or
;; use a line like
  (setq load-path (append (list "/path/to/gnuplot") load-path))

;; these lines enable the use of gnuplot mode
  (autoload 'gnuplot-mode "gnuplot" "gnuplot major mode" t)
  (autoload 'gnuplot-make-buffer "gnuplot" "open a buffer in gnuplot mode" t)

;; this line automatically causes all files with the .gp extension to
;; be loaded into gnuplot mode
  (setq auto-mode-alist (append '(("\\.gp$" . gnuplot-mode)) auto-mode-alist))

;; This line binds the function-9 key so that it opens a buffer into
;; gnuplot mode
  (global-set-key [(f9)] 'gnuplot-make-buffer)
  
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Octave
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; http://sunsite.univie.ac.at/textbooks/octave/octave_34.html

;; Use EOS Octave mode for all .m files
(setq auto-mode-alist
      (cons '("\\.m$" . octave-mode) auto-mode-alist))

;; Turn on the abbrevs, auto-fill and font-lock features automatically
(add-hook 'octave-mode-hook
          (lambda ()
            (abbrev-mode 1)
            (auto-fill-mode 1)
            (if (eq window-system 'x)
                (font-lock-mode 1))))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; C
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(defun linux-c-mode ()
  "C mode with adjusted defaults for use with the Linux kernel."
  (interactive)
  (c-mode)
  (c-set-style "K&R")
  (setq c-basic-offset 8))

(add-to-list 'auto-mode-alist '("\.c$" . linux-c-mode))

