;; emacs-gpt.el -- Control Emacs via ChatGPT
;;
;; Basic idea: take natural language input from user, ask ChatGPT for
;; corresponding elisp, run it.


(defun mark-between-assistant-and-user ()
  "Mark the region between \"%assistant%\" and \"%user%\", not including those strings."
  (interactive)
  (goto-char (point-min))
  (let ((start (search-forward "%assistant%"))
        (end (search-forward "%user%" nil t)))
    (when (and start end)
      (kill-ring-save (+ start 1) (- end 6)))))

(setq gpt-buffer-name "gpt_emacs_run.txt")

;; Kill backwards until the given string, not including that string.
(defun kill-backwards-until (s)
  "Kill backwards until the given string, not including that string."
  (interactive)
  (let
      ((old-point (point))
       (start (search-backward s)))
    (when start
      (kill-region (+ start (length s)) old-point))))


;; Interactively ask for a prompt, send to to the buffer gpt-buffer-name
;; and then run the elisp in the current buffer.
(defun gpt-run ()
  "Interactively ask for a prompt, send to to the buffer gpt-buffer-name."
  (interactive)
  (let ((prompt (read-string "Prompt: ")))
    (with-current-buffer (get-buffer-create gpt-buffer-name)
      (goto-char (point-max))
      (insert "\n\n")
      (insert prompt)
      (vh/invoke-chat-and-eval)
      ;; clear the prompt
      (kill-backwards-until "%user%"))))
