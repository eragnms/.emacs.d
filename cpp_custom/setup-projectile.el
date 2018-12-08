;; Package: projectile
;; https://projectile.readthedocs.io/en/latest/configuration/
(projectile-mode +1)
(define-key projectile-mode-map (kbd "s-p") 'projectile-command-map)
(define-key projectile-mode-map (kbd "C-c p") 'projectile-command-map)

(provide 'setup-projectile)
