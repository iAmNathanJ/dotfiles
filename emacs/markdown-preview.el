;; markdown preview
(defun markdown-grip ()
  "Load Markdown Preview in Browser"
  (interactive)
  
  (setq port "5555")

  (if (get-process "md-grip") (kill-process "md-grip"))

  (start-process "md-grip" "markdown-preview" "grip" "-b" buffer-file-name port)
  (message (concat "Markdown preview started at http://localhost:" port "/")))

(defun markdown-grip-kill ()
  (interactive)
  (kill-process "md-grip")
  (kill-buffer "markdown-preview"))
