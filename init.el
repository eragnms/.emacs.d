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

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Apperance
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Swap <Backspace> and <DEL>, to get <Backspace> to work in Terminus, see
;; https://www.gnu.org/software/emacs/manual/html_node/efaq/Backspace-invokes-help.html
(keyboard-translate ?\C-h ?\C-?)

(setq inhibit-startup-message t) ;; hide the startup message
;; enable line numbers globally and add a padding of choice
(global-linum-mode t) 
(setq linum-format "%4d \u2502 ") ; vertical bar
;;(setq linum-format "%d ") ; just a space

;; Window size and start position
(when (string= system-name "vmanjaro")
  (when window-system 
    (set-frame-position (selected-frame) 0 0)
    (set-frame-size (selected-frame) 107 54)))

;; Themes
(if (display-graphic-p)
    (progn
    ;; if graphic
       (load-theme 'leuven t))
    ;; else (on a terminal, seems ok on termius terminal set to "vt100")
       (load-theme 'whiteboard))
;(load-theme 'tango-plus)
;(load-theme 'whiteboard)
;(load-theme 'flatui))
;(load-theme 'twilight-bright t)
;(load-theme 'gandalf t)
;(load-theme 'tango)
;(load-theme 'adwaita)
;(load-theme 'leuven t)
;(load-theme 'github-modern t)



;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; My general settings and shortcuts
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Display also the column number
(setq column-number-mode t)
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

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; markdown, for txt and md files
;; require package markdown:
;; $ sudo pacman -S markdown
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
(autoload 'markdown-mode "markdown-mode"
   "Major mode for editing Markdown files" t)
(add-to-list 'auto-mode-alist '("\\.markdown\\'" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.md\\'" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.txt\\'" . markdown-mode))

(autoload 'gfm-mode "markdown-mode"
   "Major mode for editing GitHub Flavored Markdown files" t)
(add-to-list 'auto-mode-alist '("README\\.md\\'" . gfm-mode))

;(setq auto-mode-alist
;      (append '(("\\.txt\\'" . markdown-mode)
;                ("\\.md\\'" . markdown-mode)) auto-mode-alist))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; rst, reStructuredText
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
(setq auto-mode-alist
      (append '(("\\.rst\\'" . rst-mode)
                ("\\.rest\\'" . rst-mode)) auto-mode-alist))


;;(setq-default major-mode 'text-mode)
; Auto fill will break the lines after set-fill-column characters
;(add-hook 'text-mode-hook 'turn-on-auto-fill)
;(add-hook 'text-mode-hook
;          (lambda ()
;            (set-fill-column 67)))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; LaTeX
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Set line width to XX columns and turn it
;; on for Latex files
(setq-default fill-column 100)
(add-hook 'LaTeX-mode-hook 'turn-on-auto-fill)

;;(add-hook 'text-mode-hook
;;              (lambda ()
;;                (when (y-or-n-p "Auto Fill mode? ")
;;                  (turn-on-auto-fill))))

;; Load AUCTeX for LaTeX files.
;(load "auctex.el" nil t t)
;(load "preview-latex.el" nil t t)

;;;;
;; Check TeX syntax on the fly
;(require 'flymake)

;(defun flymake-get-tex-args (file-name) (list "pdflatex" 
;    (list "-file-line-error" "-draftmode" "-interaction=nonstopmode" file-name)))

;(add-hook 'LaTeX-mode-hook 'flymake-mode)

;;;;
;; Spell checking while typing
;(setq ispell-program-name "aspell") 
    ; could be ispell as well, depending on your preferences 
;(setq ispell-dictionary "english") 
    ; this can obviously be set to any language your spell-checking program supports

;(add-hook 'LaTeX-mode-hook 'flyspell-mode) 
;(add-hook 'LaTeX-mode-hook 'flyspell-buffer)

;;;;
;; Create a contents for navigation
;; Invoke with C-c =
;(require 'tex-site)
;(autoload 'reftex-mode "reftex" "RefTeX Minor Mode" t)
;(autoload 'turn-on-reftex "reftex" "RefTeX Minor Mode" nil)
;(autoload 'reftex-citation "reftex-cite" "Make citation" nil)
;(autoload 'reftex-index-phrase-mode "reftex-index" "Phrase Mode" t)
;(add-hook 'latex-mode-hook 'turn-on-reftex) ; with Emacs latex mode
;; (add-hook 'reftex-load-hook 'imenu-add-menubar-index)
;(add-hook 'LaTeX-mode-hook 'turn-on-reftex)

;(setq LaTeX-eqnarray-label "eq"
;LaTeX-equation-label "eq"
;LaTeX-figure-label "fig"
;LaTeX-table-label "tab"
;LaTeX-myChapter-label "chap"
;TeX-auto-save t
;TeX-newline-function 'reindent-then-newline-and-indent
;TeX-parse-self t
;TeX-style-path
;'("style/" "auto/"
;"/usr/share/emacs21/site-lisp/auctex/style/"
;"/var/lib/auctex/emacs21/"
;"/usr/local/share/emacs/site-lisp/auctex/style/")
;LaTeX-section-hook
;'(LaTeX-section-heading
;LaTeX-section-title
;LaTeX-section-toc
;LaTeX-section-section
;LaTeX-section-label))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Perl
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Use cperl-mode instead of the default perl-mode
(mapc
     (lambda (pair)
       (if (eq (cdr pair) 'perl-mode)
           (setcdr pair 'cperl-mode)))
     (append auto-mode-alist interpreter-mode-alist))

;;;;
;; Turn autoindenting on
(global-set-key "\r" 'newline-and-indent)

;;;;
;; Disable indication of whitespaces
(setq cperl-invalid-face nil)

;;;;
;; Expands for keywords such as foreach, while, etc...
(setq cperl-electric-keywords t) 

;;;;
;; Short cuts
(global-set-key "\M-d" 'perldb) ; Start debugger on ESC-d

;;;;
;; Use 4 space indents via cperl mode
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(cperl-close-paren-offset -4)
 '(cperl-continued-statement-offset 4)
 '(cperl-indent-level 4)
 '(cperl-indent-parens-as-block t)
 '(cperl-tab-always-indent t)
 '(custom-safe-themes
   (quote
    ("4af6fad34321a1ce23d8ab3486c662de122e8c6c1de97baed3aa4c10fe55e060" "c1390663960169cd92f58aad44ba3253227d8f715c026438303c09b9fb66cdfb" "15348febfa2266c4def59a08ef2846f6032c0797f001d7b9148f30ace0d08bcf" "6de7c03d614033c0403657409313d5f01202361e35490a3404e33e46663c2596" "938d8c186c4cb9ec4a8d8bc159285e0d0f07bad46edf20aa469a89d0d2a586ea" "c1fb68aa00235766461c7e31ecfc759aa2dd905899ae6d95097061faeb72f9ee" "77bd459212c0176bdf63c1904c4ba20fce015f730f0343776a1a14432de80990" "5acb6002127f5d212e2d31ba2ab5503df9cd1baa1200fbb5f57cc49f6da3056d" "ecb9fe1d5b165a35499191a909b2b5710a52935614058b327a39bfbbb07c7dc8" "78559045fb299f3542c232166ad635c59cf0c6578d80a58b885deafe98a36c66" "20e23cba00cf376ea6f20049022241c02a315547fc86df007544852c94ab44cb" "707227acad0cf8d4db55dcf1e574b3644b68eab8aca4a8ce6635c8830bc72144" "5dc0ae2d193460de979a463b907b4b2c6d2c9c4657b2e9e66b8898d2592e3de5" "1b8d67b43ff1723960eb5e0cba512a2c7a2ad544ddb2533a90101fd1852b426e" "06f0b439b62164c6f8f84fdda32b62fb50b6d00e8b01c2208e55543a6337433a" "bb08c73af94ee74453c90422485b29e5643b73b05e8de029a6909af6a3fb3f58" "d677ef584c6dfc0697901a44b885cc18e206f05114c8a3b7fde674fce6180879" "6ffef0161169e444b514a0f7f0cb7eac09d11c396cdc99bf85360a361c427886" "44c566df0e1dfddc60621711155b1be4665dd3520b290cb354f8270ca57f8788" default)))
 '(inhibit-startup-screen t)
 '(mlint-programs (quote ("mlint" "glnx86/mlint")))
 '(package-selected-packages
   (quote
    (iedit wgrep flatui-theme ample-theme twilight-bright-theme github-modern-theme elpy)))
 '(show-paren-mode t))

;;;;
;; Insert spaces instead of tabs
(setq-default indent-tabs-mode nil)

;;;;
(add-hook 'cperl-mode-hook
  '(lambda () (auto-fill-mode 1)))

;;;;
;; Expand the following abbreviations while typing in text files...
(abbrev-mode 1)

(define-abbrev-table 'global-abbrev-table '(
  ("pdbg"  "use Data::Dumber qw( Dumper );\nwarn Dumper[];"   nil 1)
  ("phbp"  "#! /usr/bin/perl -w"                              nil 1)
  ("pbmk"  "use Benchmark qw( cmpthese );\ncmpthese -10, {};" nil 1)
  ("pusc"  "use Smart::Comments;\n\n### "                     nil 1)
  ("putm"  "use Test::More 'no_plan';"                        nil 1)
  ))

(add-hook 'text-mode-hook (lambda () (abbrev-mode 1)))

;; custom-set-faces was added by Custom.
;; If you edit it by hand, you could mess it up, so be careful.
;; Your init file should contain only one such instance.
;; If there is more than one, they won't work right.
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:family "Monospace" :foundry "monotype" :slant normal :weight normal :height 98 :width normal)))))

;;(define-key global-map [f2]   'replace-string)
(define-key global-map [f2]   'query-replace)
(define-key global-map [f3]   'undo)
(define-key global-map [f4]   'repeat-complex-command)
(define-key global-map [f5]   'goto-line)
(define-key global-map [f9]   'iconify-frame)
(define-key global-map [C-home] 'beginning-of-buffer)
(define-key global-map [C-end] 'end-of-buffer)

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

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Python
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Install elpy
;; - restart emacs
;; - M-x eval-buffer
;; - M-x package-refresh-contents
;; - M-x package-install RET elpy RET
:init (with-eval-after-load 'python 
      (elpy-enable)
      (delete `elpy-module-highlight-indentation elpy-modules)
      (setq elpy-rpc-timeout 10)
      (defalias 'workon 'pyvenv-workon)

      ;; Check syntax on the fly, does not seem to work?
      (when (require 'flycheck nil t)
        (setq elpy-modules (delq 'elpy-module-flymake elpy-modules))
        (add-hook 'elpy-mode-hook 'flycheck-mode))

      (require 'py-autopep8)
      (add-hook 'elpy-mode-hook 'py-autopep8-enable-on-save))
