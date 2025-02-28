;; https://orgmode.org
;; Customize: https://orgmode.org/worg/org-configs/org-customization-guide.html
(add-hook 'org-mode-hook 'turn-on-font-lock)

;; Define how much shall be folded when a document is opened
;; https://orgmode.org/manual/Initial-visibility.html
;;
;; Non-nil means entering Org mode will switch to OVERVIEW.
;; This can also be configured on a per-file basis by adding one of
;; the following lines anywhere in the buffer:
;;   #+STARTUP: fold              (or ‘overview’, this is equivalent)
;;   #+STARTUP: nofold            (or ‘showall’, this is equivalent)
;;   #+STARTUP: content
;;   #+STARTUP: showeverything
;;
;; Show overview when open
(setq org-startup-folded t)

;; set specific browser to open links
(setq browse-url-browser-function 'browse-url-firefox)

;; Files to run in org mode
(add-to-list 'auto-mode-alist '("\\.org\\'" . org-mode))

;; Save the clock history across Emacs sessions
(setq org-clock-persist 'history)
(org-clock-persistence-insinuate)

;; Alert at idle time
(setq org-clock-idle-time 15)

;; TODO workflow states
(setq org-todo-keywords
      '((sequence "TODO(t)" "RFQ(r)" "QUOTED(q)" "ORDERED(o)" "|" "DONE(d)")))
;;(setq org-todo-keywords
;;      '((sequence "☛ TODO(t)" "⚑ ONGOING(o)" "|" "✔ DONE(d)")))

;; Note the time when a TODO was closed
(setq org-log-done 'time)

;; Bindings for org-mode
(global-set-key "\C-cl" 'org-store-link)
(global-set-key "\C-ca" 'org-agenda)
(global-set-key "\C-cc" 'org-capture)
(global-set-key "\C-cb" 'org-iswitchb)

;; Some default files and folders
(setq org-default-notes-file "~/orgsync/org/inbox.org")
(setq org-directory "~/orgsync/org/")

;; Those are the files from which org will build the agenda
(add-to-list 'load-path "~/orgsync/org/agenda")
(require 'setup-org-agenda-list)

;; Apperance
(setq org-hide-leading-stars 1)
(setq org-return-follows-link 1)
(setq org-startup-truncated nil)
;; Nice bullets
(use-package org-bullets
  :ensure t
  :init
  (setq org-bullets-bullet-list
        '("◉" "◎" "⚫" "○" "►" "◇"))
  :config
  (add-hook 'org-mode-hook (lambda () (org-bullets-mode 1))))

;; Convert the current buffer's content using pandoc from markdown to orgmode
;; format and save it with the current buffer's file name but with .org extension."
(defun markdown-convert-buffer-to-org ()
  (interactive)
  (shell-command-on-region (point-min) (point-max)
                           (format "pandoc -f markdown -t org -o %s"
                                   (concat (file-name-sans-extension (buffer-file-name)) ".org"))))

;; Default values for todos
(setq org-capture-templates
      '(("t" "todo" entry (file+headline "~/orgsync/org/inbox.org" "Tasks")
         "* TODO %?\nSCHEDULED: %(org-insert-time-stamp (org-read-date nil t \"+0d\"))\n")
        ("f" "foocrm" entry (file+headline "~/orgsync/org/foocrm.org" "Open Cases")
         "* RFQ %?\nSCHEDULED: %(org-insert-time-stamp (org-read-date nil t \"+0d\"))\n\n|Heading:||\n|-|\n|Customer:||\n|Customer location:||\n|Contact person:||\n|Supplier:||\n|Supplier quote:||\n|MCN quote:||\n|Customer order:||\n|MCN order:||\n|MCN PO:||\n|Supplier OA:||\n|Supplier delivery date:||\n|MCN delivery date:||\n\n** Actions: \n"))
      )

;; Ageda sorting strategy of todos
(setq org-agenda-sorting-strategy
      (quote
       ((agenda deadline-up priority-down)
        (todo priority-down category-keep)
        (tags priority-down category-keep)
        (search category-keep))))

;; Agenda start week on Monday
(setq org-agenda-start-on-weekday 1)

;; Make captions appear below tables in Latex
(setq org-latex-caption-above nil)

;; For figure references when generating latex
;; https://emacs.stackexchange.com/questions/32648/in-org-mode-how-do-i-reference-a-figure
(setq org-latex-prefer-user-labels t)

;; Turn off WindMove
;; WindMove will otherwise shift window on S-arrow, which I want to use
;; in org mode to change timestamps. With the new keybinding set up int
;; programming.el, I think I can start using windmove again.
; (windmove-mode 0)
