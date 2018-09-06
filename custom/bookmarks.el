;; For me, bookmarks serve two functions. First, as a way to jump back to
;; interesting places by name (and annotate those places), and second, as form
;; of bread crumbs while I’m toiling around a large codebase.
;; For normal bookmarks, I’d rather use Helm:
(use-package bookmark
  :init (setq bookmark-save-flag 1)
  :config
  (defun ha/add-bookmark (name)
    (interactive
     (list (let* ((filename  (file-name-base (buffer-file-name)))
                  (project   (projectile-project-name))
                  (func-name (which-function))
                  (initial   (format "%s::%s:%s " project filename func-name)))
             (read-string "Bookmark: " initial))))
    (bookmark-set name))
  :bind  (("C-c b m" . ha/add-bookmark)
          ("C-x r m" . ha/add-bookmark)
          ("C-x r b" . helm-bookmarks)))

;; Visual Bookmarks… Breadcrumbs
;; For dropping visual breadcrumbs throughout a single file or multiple files,
;; use my better-breadcrumbs mode.
 (require 'better-breadcrumbs)
 (load-library "better-breadcrumbs")
(better-breadcrumbs-mode +1)
