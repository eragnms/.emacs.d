;; This file is to start all company stuff
(provide 'company-setup)

(require 'company)
(add-hook 'after-init-hook 'global-company-mode)
(setq company-backends (delete 'company-semantic company-backends))
(define-key c-mode-map  [(tab)] 'company-complete)
(define-key c++-mode-map  [(tab)] 'company-complete)

;; company-c-headers
(use-package company-c-headers
  :init
  (add-to-list 'company-backends 'company-c-headers))
