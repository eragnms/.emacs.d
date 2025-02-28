;;;;;;;;;;;;;;;;
;; Debugger
;;;;;;;;;;;;;;;;
(require 'dap-mode)
(dap-mode 1)
;; The modes below are optional
(dap-ui-mode 1)
;; enables mouse hover support
(dap-tooltip-mode 1)
;; use tooltips for mouse hover
;; if it is not enabled `dap-mode' will use the minibuffer.
(tooltip-mode 1)
;; displays floating panel with debug buttons requies emacs 26+
(dap-ui-controls-mode 1)
;; Python
(require 'dap-python)
;; Ensure dap-mode uses debugpy instead of ptvsd
(setq dap-python-debugger 'debugpy)
;; Register a debug configuration for pytest in Docker
;(dap-register-debug-template
;  "Docker Pytest Debug"
;  (list :type "python"
;        :args ""  ;; Add any pytest args you need here (e.g., "-s" to disable output capturing)
;        :cwd nil
;        :env '(("DEBUG" . "1"))
;        :target-module (expand-file-name "/usr/src/app/linux-application/wipe")  ;; Adjust this if needed
;        :request "attach"
;        :connect (list :host "localhost" :port 5678)
;        :name "Docker Pytest Debug"))
;        :pathMappings (list (list :"localRoot" "/home/mats/projects/wittra-gateway/linux-application/wipe"
;                                  :"remoteRoot" "/usr/src/app/linux-application/wipe"))))

;(add-hook 'dap-stopped-hook
;          (lambda (arg) (call-interactively #'dap-hydra)))

;; A template named "Python :: Run Configuration" will appear, which will execute
;; the currently visited module. This will fall short whenever you need to specify
;; arguments, environment variables or execute a setuptools based script. In such
;; case, define a template:
;(dap-register-debug-template "My App"
;  (list :type "python"
;        :args "-i"
;        :cwd nil
;        :env '(("DEBUG" . "1"))
;        :target-module (expand-file-name "~/src/myapp/.env/bin/myapp")
;        :request "launch"
;        :name "My App"))
;; C++
;(require 'dap-cpptools)
