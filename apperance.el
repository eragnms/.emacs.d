;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Apperance
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(setq inhibit-startup-message t) ;; hide the startup message
;; enable line numbers globally and add a padding of choice
(global-linum-mode t)
(if (display-graphic-p)
    (progn
    ;; if graphic
      ())
      (setq linum-format "%4d \u2502 ")) ; vertical bar
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

