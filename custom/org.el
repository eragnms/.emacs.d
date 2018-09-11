;; https://orgmode.org
;; Customize: https://orgmode.org/worg/org-configs/org-customization-guide.html
(add-hook 'org-mode-hook 'turn-on-font-lock)

;; Files to run in org mode
(add-to-list 'auto-mode-alist '("\\.org\\'" . org-mode))

;; Save the clock history across Emacs sessions
(setq org-clock-persist 'history)
(org-clock-persistence-insinuate)

;; Alert at idle time
(setq org-clock-idle-time 15)

;; TODO workflow states
(setq org-todo-keywords
      '((sequence "TODO" "ONGOING" "|" "DONE")))

;; Note the time when a TODO was closed
(setq org-log-done 'time)

;; Bindings for org-mode
(global-set-key "\C-cl" 'org-store-link)
(global-set-key "\C-ca" 'org-agenda)
(global-set-key "\C-cc" 'org-capture)
(global-set-key "\C-cb" 'org-iswitchb)

;; Some default files and folders
(setq org-default-notes-file "~/nextcloud/org/inbox.org")
(setq org-directory "~/nextcloud/org/")

;; Those are the files from which org will build the agenda
(add-to-list 'load-path "~/nextcloud/org/agenda")
(require 'setup-org-agenda-list)

;; Apperance
(setq org-hide-leading-stars 1)
(setq org-return-follows-link 1)
