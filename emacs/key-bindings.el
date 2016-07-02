; thanks be to god
(global-set-key (kbd "<escape>") 'god-local-mode)
(define-key god-local-mode-map (kbd "i") 'god-local-mode)
(define-key god-local-mode-map (kbd ".") 'repeat)
(define-key isearch-mode-map (kbd "<escape>") 'god-mode-isearch-activate)
(define-key god-mode-isearch-map (kbd "<escape>") 'god-mode-isearch-disable)

; markdown preview
(global-set-key (kbd "C-M-p") 'markdown-grip)
(global-set-key (kbd "C-M-k") 'markdown-grip-kill)

; helm
(global-set-key (kbd "M-x") 'helm-M-x)
(global-set-key (kbd "C-M-b") 'helm-buffers-list)
(global-set-key (kbd "C-M-f") 'helm-projectile-find-file)

; helpers
(global-set-key (kbd "M-n") 'jump-down-5)
(global-set-key (kbd "M-p") 'jump-up-5)
