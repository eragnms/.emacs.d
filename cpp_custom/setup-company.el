;; This file is to start all company stuff
(provide 'setup-company)

(require 'company)
(add-hook 'after-init-hook 'global-company-mode)
(setq company-backends (delete 'company-semantic company-backends))
;(define-key c-mode-map  [(tab)] 'company-complete)
;(define-key c++-mode-map  [(tab)] 'company-complete)

;; company-c-headers
(use-package company-c-headers
  :init
  (add-to-list 'company-backends 'company-c-headers))

;; Supposed to solve an issue with company and semantics being slow
;; https://github.com/syl20bnr/spacemacs/issues/11058#issuecomment-407269954
;; https://github.com/syl20bnr/spacemacs/issues/1907
(defun et/semantic-remove-hooks ()
    (remove-hook 'completion-at-point-functions
                 'semantic-analyze-completion-at-point-function)
    (remove-hook 'completion-at-point-functions
                 'semantic-analyze-notc-completion-at-point-function)
    (remove-hook 'completion-at-point-functions
                 'semantic-analyze-nolongprefix-completion-at-point-function))

  (add-hook 'semantic-mode-hook #'et/semantic-remove-hooks)
