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
(load-user-file "programming.el")
(load-user-file "org.el")
(load-user-file "markdown.el")
(load-user-file "restructured.el")
(load-user-file "latex.el")
(load-user-file "gnu_plot.el")
(load-user-file "spelling.el")
(load-user-file "magit.el")
(load-user-file "multi_scratch.el")
(load-user-file "encrypt_files.el")
(load-user-file "disp_command_settings.el")
(load-user-file "keyboard.el")
(load-user-file "tramp.el")
(load-user-file "misc.el")
(load-user-file "docker.el")
(load-user-file "chat_gpt.el")
;; The wittra.el contains info on how to set Wittra
;; c-coding style
;;(load-user-file "wittra.el")

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(auth-source-save-behavior nil)
 '(company-quickhelp-color-background "#4F4F4F")
 '(company-quickhelp-color-foreground "#DCDCCC")
 '(custom-safe-themes
   '("e6df46d5085fde0ad56a46ef69ebb388193080cc9819e2d6024c9c6e27388ba9" "a37d20710ab581792b7c9f8a075fcbb775d4ffa6c8bce9137c84951b1b453016" default))
 '(nrepl-message-colors
   '("#CC9393" "#DFAF8F" "#F0DFAF" "#7F9F7F" "#BFEBBF" "#93E0E3" "#94BFF3" "#DC8CC3"))
 '(package-selected-packages
   '(json-mode multiple-cursors lsp-ui undo-tree flycheck-mypy py-isort volatile-highlights graphql org-bullets smartparens smartparens-config srefactor company-c-headers wgrep use-package sr-speedbar py-autopep8 org iedit helm-projectile helm-gtags function-args flycheck elpy better-defaults))
 '(pdf-view-midnight-colors '("#DCDCCC" . "#383838"))
 '(safe-local-variable-values
   '((eval progn
           (setq-local my-local-root
                       (projectile-project-root))
           (setq-local my-local-path
                       (expand-file-name "linux-application/wipe" my-local-root))
           (setq dap-debug-template-configurations
                 `(("Docker Pytest Debug" :type "python" :request "attach" :hostName "localhost" :port 5678 :name "Docker Pytest Debug" :pathMappings
                    (((:localRoot \, my-local-path)
                      (:remoteRoot . "/usr/src/app/linux-application/wipe")))))))
     (eval progn
           (setq-local my-local-root
                       (projectile-project-root))
           (setq-local my-local-path
                       (expand-file-name "." my-local-root))
           (setq dap-debug-template-configurations
                 `(("Local Pytest Debug" :type "python" :request "attach" :connect
                    (:host "localhost" :port 5678)
                    :name "Local Pytest Debug" :pathMappings
                    (((:localRoot \, my-local-path)
                      (:remoteRoot \, my-local-path)))))))
     (default-directory . /home/mats/projects/linux-application/xtrx-beacon/)
     (default-directory . /home/mats/projects/linux-application/xtrx-beacon)
     (flycheck-checker . python-mypy)
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
