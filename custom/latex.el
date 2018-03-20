;; Set line width to XX columns and turn it
;; on for Latex files
(setq-default fill-column 100)
(add-hook 'LaTeX-mode-hook 'turn-on-auto-fill)

