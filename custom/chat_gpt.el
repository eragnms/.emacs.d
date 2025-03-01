;(load-user-file "chat_gpt_integration.el")
;; Below does not work
;(load-user-file "emacs_gpt.el")
;; Below works a bit so and so
;(load-user-file "org_ai.el")
(load-user-file "gptel.el")
(load-user-file "emacs_command_generator.el")

;; https://github.com/zerolfx/copilot.el
;; sudo pacman -S nodejs npm
;; sudo npm install -g @github/copilot-language-server
;; cd projects
;; git clone https://github.com/zerolfx/copilot.el
(add-to-list 'load-path "~/projects/copilot.el")
(require 'copilot)
(add-hook 'prog-mode-hook 'copilot-mode)
(define-key copilot-completion-map (kbd "<tab>") 'copilot-accept-completion)
(define-key copilot-completion-map (kbd "TAB") 'copilot-accept-completion)
