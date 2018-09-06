;; Synchronize notes formatted in org-mode across multiple computers with
;; cloud storage services, like Dropbox? Those files are cached in various
;; other storage facilities… so, I use symmetric key encryption with PGP.
;; To get started on the Mac, install the goodies:
;; brew install gpg
;; Now, any file loaded with a gpg extension, e.g. some.org.gpg, will prompt
;; for a password (and then use org-mode). Since these files are for my eyes
;; only, I don’t need the key-ring prompt:
(setq epa-file-select-keys 2)
;; If you trust your Emacs session on your computer, you can have Emacs cache
;; the password.
(setq epa-file-cache-passphrase-for-symmetric-encryption t)

;; List the repositories containing them
(require 'package)
