;; http://sunsite.univie.ac.at/textbooks/octave/octave_34.html

;; Use EOS Octave mode for all .m files
(setq auto-mode-alist
      (cons '("\\.m$" . octave-mode) auto-mode-alist))

;; Turn on the abbrevs, auto-fill and font-lock features automatically
(add-hook 'octave-mode-hook
          (lambda ()
            (abbrev-mode 1)
            (auto-fill-mode 1)
            (if (eq window-system 'x)
                (font-lock-mode 1))))
