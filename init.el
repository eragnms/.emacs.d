;; Based on:
;; https://tuhdo.github.io/c-ide.html
;; https://github.com/howardabrams/dot-files/blob/master/emacs.org

;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
;(package-initialize)

;; Show the messages buffer at startup
;; In a split screen:
(view-echo-area-messages)
;; In the whole buffer:
;;(with-current-buffer (messages-buffer)
;;  (goto-char (point-max))
;;  (switch-to-buffer (current-buffer)))

(defconst user-init-dir  "~/.emacs.d/custom/")

(defun load-user-file (file)
  (interactive "f")
  "Load a file in current user's configuration directory"
  (load-file (expand-file-name file user-init-dir)))

(load-user-file "packages.el")
(load-user-file "auto_update.el")
(load-user-file "apperance.el")
(load-user-file "python.el")
(load-user-file "markdown.el")
(load-user-file "restructured.el")
(load-user-file "latex.el")
(load-user-file "perl.el")
(load-user-file "gnu_plot.el")
(load-user-file "octave.el")
(load-user-file "cpp.el")
(load-user-file "org.el")
(load-user-file "magit.el")
(load-user-file "multi_scratch.el")
(load-user-file "encrypt_files.el")
(load-user-file "disp_command_settings.el")
(load-user-file "keyboard.el")
(load-user-file "tramp.el")

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   '(undo-tree flycheck-mypy py-isort volatile-highlights graphql org-bullets smartparens smartparens-config srefactor company-c-headers wgrep use-package sr-speedbar py-autopep8 org iedit helm-projectile helm-gtags function-args flycheck elpy better-defaults))
 '(safe-local-variable-values
   '((flycheck-checker . python-mypy)
     (company-clang-arguments "-I/home/mats/projects/sdr-baseline/include")
     (company-clang-arguments "-I/home/mats/projects/SoapySDR_TXRX_Burst_Tester/SoapySDR_TXRX_Burst_Tester/classes/sdr/" "-I/home/mats/projects/SoapySDR_TXRX_Burst_Tester/SoapySDR_TXRX_Burst_Tester/classes/utils/")
     (company-clang-arguments "-I/home/mats/projects/limesdr/include")
     (projectile-project-compilation-cmd . "make -C build -j2")
     (company-clang-arguments "-I/home/mats/projects/cellscan/tabor/cellscan-tabor-lte/lte_scanner/include/" "-I/home/mats/projects/cellscan/tabor/cellscan-tabor-lte/lib_cellscan_tools/include/" "-I/home/mats/projects/cellscan/tabor/cellscan-tabor-lte/")
     (company-clang-arguments "-I/home/mats/projects/cellscan/tabor/cellscan-tabor-lte/lte_scanner/include/" "-I/home/mats/projects/cellscan/tabor/cellscan-tabor-lte/lib_cellscan_tools/include/")
     (company-clang-arguments "-I/home/mats/projects/cellscan/tabor/cellscan-tabor-lte/lte_scanner/include/")
     (company-clang-arguments "-I/home/mats/gitdev/cellscan-tabor-wcdma/wcdma_scanner/include/" "-I/home/mats/gitdev/cellscan-tabor-wcdma/example/include")))
 '(semantic-mode t))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
