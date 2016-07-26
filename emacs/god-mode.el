;; turn on god-mode
(god-mode)

;; update cursor on god-mode
(defun god-cursor ()
  (set-cursor-color (if (or god-local-mode buffer-read-only) "#ff79c6" "#ffffff")))

;; update modeline on god-mode
(defun c/god-mode-update-cursor ()
  (let ((limited-colors-p (> 257 (length (defined-colors)))))
    (cond (god-local-mode (progn
                            (set-face-background 'mode-line (if limited-colors-p "white" "#de5577"))
                            (set-face-background 'mode-line-inactive (if limited-colors-p "white" "#de5577"))))
          (t (progn
               (set-face-background 'mode-line (if limited-colors-p "black" "#6272a4"))
               (set-face-background 'mode-line-inactive (if limited-colors-p "black" "#6272a4")))))))

;; hook it up
(add-hook 'god-mode-enabled-hook 'c/god-mode-update-cursor)
(add-hook 'god-mode-disabled-hook 'c/god-mode-update-cursor)
(add-hook 'minibuffer-setup-hook 'c/god-mode-update-cursor)
(add-hook 'minibuffer-exit-hook 'c/god-mode-update-cursor)
(add-hook 'buffer-list-update-hook 'c/god-mode-update-cursor)

(add-hook 'god-mode-enabled-hook 'god-cursor)
(add-hook 'god-mode-disabled-hook 'god-cursor)
(add-hook 'minibuffer-setup-hook 'god-cursor)
(add-hook 'minibuffer-exit-hook 'god-cursor)
(add-hook 'buffer-list-update-hook 'god-cursor)
