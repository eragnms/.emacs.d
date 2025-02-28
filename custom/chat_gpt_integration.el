;; Emacs Lisp wrapper around Python scripts for ChatGPT.
;;
;; Basic idea is to send buffer as stdin to Python script.

(defvar gpt-script "/home/mats/.emacs.d/custom/chat.py")

(defun vh/invoke-chat ()
  "Send contents of current buffer as stdin to command, then append output to current buffer."
  (interactive)
  (let*
      ;; Set up and invoke the process.
      ((command gpt-script)
       (process-name "chat-gpt-process")
       (buffer-name "*chat-gpt-output*")
       (process
        (make-process
         :name process-name
         :buffer buffer-name
         :command (list command)
         :connection-type 'pipe))
       (main-buffer (current-buffer)))
    ;; Setting a process filter that processes the ChatGPT output.
    (set-process-filter process
     (lambda (process output)
       (save-excursion
         (goto-char (point-max))
         (insert "\n\n%assistant%\n")
         (insert output)
         (insert "\n\n%user%\n"))))
    ;; This sends the buffer contents to the process via stdin.
    ;; The filter above will append the output to the current buffer.
    (with-current-buffer
        (process-buffer process)
      (erase-buffer)
      (insert-buffer-substring main-buffer)
      (goto-char (point-max))
      (process-send-region process (point-min) (point-max))
      (process-send-eof process)
      (message "Sent buffer to GPT API"))))


;; https://emacs.stackexchange.com/questions/19877/how-to-evaluate-elisp-code-contained-in-a-string
(defun my-eval-string (string)
  "Evaluate elisp code stored in a string."
  (eval (car (read-from-string string))))

;; put reply of ChatGPT and eval it.
;; THIS IS ONLY FOR EXPERIMENTAL EMACS-GPT INTEGRATION.
(defun vh/invoke-chat-and-eval ()
  (interactive)
  (let*
      ;; Set up and invoke the process.
      ((command gpt-script)
       (process-name "chat-gpt-process")
       (buffer-name "*chat-gpt-output*")
       (process
        (make-process
         :name process-name
         :buffer buffer-name
         :command (list command)
         :connection-type 'pipe))
       (main-buffer (current-buffer)))
    ;; Setting a process filter makes output go to current buffer.
    (set-process-filter
     process
     (lambda (process output)
       ;; send "output" to eval-expression.
       (message "ChatGPT reply: %s" output)
       (my-eval-string output)))
    ;; This sends the buffer contents to the process via stdin.
    ;; The filter above will append the output to the current buffer.
    (with-current-buffer
        (process-buffer process)
      (erase-buffer)
      (insert-buffer-substring main-buffer)
      (goto-char (point-max))
      (process-send-region process (point-min) (point-max))
      (process-send-eof process)
      (message "Sent buffer to GPT API"))))


;; Since GPT API returns replies in markdown mode, build a derived mode.
(require 'markdown-mode)


;; Regex that matches "%user%" or "%assistant%" or "%system%".
(defconst vh/chat-gpt-regex
  (rx (or (seq "%user%")
          (seq "%assistant%")
          (seq "%system%"))))

;; Go to next occurrence of a regex.
(defun vh/chat-gpt-next-regex ()
  "Go to next occurrence of a regex."
  (interactive)
  (re-search-forward vh/chat-gpt-regex))

;; Go to previous occurrence of a regex.
(defun vh/chat-gpt-prev-regex ()
  "Go to previous occurrence of a regex."
  (interactive)
  (re-search-backward vh/chat-gpt-regex))


(defvar chat-gpt-markdown-mode-hook nil)

(defvar chat-gpt-markdown-mode-map
(let ((map (make-sparse-keymap)))
    (define-key map (kbd "M-n") 'vh/chat-gpt-next-regex)
    (define-key map (kbd "M-p") 'vh/chat-gpt-prev-regex)
    (define-key map (kbd "M-RET") 'vh/invoke-chat)
    map)
"Keymap for `chat-gpt-markdown-mode'.")


(setq markdown-mode-font-lock-keywords
      (append markdown-mode-font-lock-keywords
              '(("%system%" . font-lock-keyword-face)
                ("%assistant%" . font-lock-keyword-face)
                ("%user%" . font-lock-keyword-face))))


(define-derived-mode chat-gpt-markdown-mode markdown-mode "Markdown Mode for ChatGPT"
  "Major mode for editing ChatGPT transcripts."
  (setq font-lock-defaults '(markdown-mode-font-lock-keywords))
  (setq-local markdown-mode-map chat-gpt-markdown-mode-map)
  (run-hooks 'chat-gpt-markdown-mode-hook))


(provide 'chat-gpt)
