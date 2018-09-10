;; https://orgmode.org
(add-hook 'org-mode-hook 'turn-on-font-lock)

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

(setq org-default-notes-file "~/nextcloud/org/inbox.org")

;; Those are the files from which org will build the agenda
(add-to-list 'load-path "~/nextcloud/org/agenda")
(require 'setup-org-agenda-list)
