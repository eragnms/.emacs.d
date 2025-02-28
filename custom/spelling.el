;; flyspell spell checking
;; http://www-sop.inria.fr/members/Manuel.Serrano/flyspell/flyspell.html
;; NOTE! aspell should be installed by the distro, e.g. using pacman

;; Enable flyspell in text mode (and derived modes)
;; The derived modes should cover: org, latex and LaTeX modes since they derive from text mode
(add-hook 'text-mode-hook 'flyspell-mode)

;; For better performance
(setq flyspell-issue-message-flag nil)

;; Corrections may be sorted by alphabetical ordering (the default) or by likeness to the
;; current word ordering. To enable the likeness criteria:
(setq flyspell-sort-corrections nil)

;; To use aspell instead of ispell
(setq ispell-program-name "aspell")
(setq ispell-list-command "--list")

;; Cycle through dictionaries
(let ((langs '("english" "svenska")))
  (setq lang-ring (make-ring (length langs)))
  (dolist (elem langs) (ring-insert lang-ring elem)))
(defun cycle-ispell-languages ()
  (interactive)
  (let ((lang (ring-ref lang-ring -1)))
    (ring-insert lang-ring lang)
    (ispell-change-dictionary lang)))
(global-set-key [f6] 'cycle-ispell-languages)

;; easy spell check
;; - F8 will call ispell (or aspell, etc) for the word the cursor is on (or near).
;; You can also use the built-in key binding M-$.
;; - Ctrl-Shift-F8 enables/disables FlySpell for your current buffer (highlights
;; misspelled words as you type)
;; - Ctrl-Meta-F8 runs FlySpell on your current buffer (highlights all misspelled
;; words in the buffer)
;; - Ctrl-F8 calls ispell for the FlySpell highlighted word prior to the cursor’s position
;; - (Does not work?) Meta-F8 calls ispell for the FlySpell highlighted word after the
;; cursor’s position
(global-set-key (kbd "<f8>") 'ispell-word)
(global-set-key (kbd "C-S-<f8>") 'flyspell-mode)
(global-set-key (kbd "C-M-<f8>") 'flyspell-buffer)
(global-set-key (kbd "C-<f8>") 'flyspell-check-previous-highlighted-word)
(defun flyspell-check-next-highlighted-word ()
  "Custom function to spell check next highlighted word"
  (interactive)
  (flyspell-goto-next-error)
  (ispell-word)
  )
;(global-set-key (kbd "M-<f8>") 'flyspell-check-next-highlighted-word)
