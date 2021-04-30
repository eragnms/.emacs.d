;; hide the startup message
(setq inhibit-startup-message t)

;; enable line numbers globally and add a padding of choice
(global-linum-mode t)
(if (display-graphic-p)
    (progn
      ;; if graphic
      ())
  ;;(setq linum-format "%4d \u2502 ")) ; vertical bar
  (setq linum-format "%d ")) ; just a space

;; Display also the column number
(setq column-number-mode t)

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
       ;(load-theme 'whiteboard))
       (load-theme 'zenburn t))

;; Set default font
;(set-face-attribute 'default nil
;                    :family "Monospace Regular"
;                    :height 110
;                    :weight 'normal
;                    :width 'normal)
(add-to-list 'default-frame-alist
             '(font . "DejaVu Sans Mono-10"))

;; rgrep will fail if fish shell is used
(setq shell-file-name "/bin/sh")

;; Increase the cache before starting garbage collection:
(setq gc-cons-threshold 50000000)

;; Remove the warnings from the GnuTLS library when using HTTPS…
;; increase the minimum prime bits size:
(setq gnutls-min-prime-bits 4096)

;; Fix the scrolling to keep point in the center:
(setq scroll-conservatively 10000
      scroll-preserve-screen-position t)

;; Get rid of the beeps
(setq visible-bell t)

;; Toolbars were only cool with XEmacs
;; Scrollbars are waste screen estate
(when (window-system)
  (tool-bar-mode 0)
  (when (fboundp 'horizontal-scroll-bar-mode)
    (horizontal-scroll-bar-mode -1))
  (scroll-bar-mode -1))

;; Always, and I do mean always strip all trailing whitespace from the file.
(add-hook 'before-save-hook 'delete-trailing-whitespace)

;; Save the point position for every file, and restore it when that file is
;; reloaded.
;;(use-package saveplace
;;  :init
;;  (setq-default save-place t)
;;  (setq save-place-forget-unreadable-files t
;;        save-place-skip-check-regexp
;;        "\\`/\\(?:cdrom\\|floppy\\|mnt\\|/[0-9]\\|\\(?:[^@/:]*@\\)?[^@/:]*[^@/:.]:\\)"))
(if (fboundp #'save-place-mode)
  (save-place-mode +1)
  (setq-default save-place t))

;; Eshell
;; The smart display can also be set not to use this extended “edit mode” if
;; the command returns successfully, and without displaying output, like chown
;; for instance.
(require 'eshell)
(require 'em-smart)
(setq eshell-where-to-jump 'begin)
(setq eshell-review-quick-commands nil)
(setq eshell-smart-space-goes-to-end t)

;; UTF8 everywhere
(setq locale-coding-system 'utf-8)
(set-terminal-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)
(set-selection-coding-system 'utf-8)
(prefer-coding-system 'utf-8)
(when (display-graphic-p)
  (setq x-select-request-type '(UTF8_STRING COMPOUND_TEXT TEXT STRING)))

;; Undo tree customizations
(setq undo-tree-visualizer-diff t)
(setq undo-tree-visualizer-timestamps t)
