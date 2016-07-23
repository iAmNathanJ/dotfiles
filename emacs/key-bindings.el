;; map command key to meta key
(setq mac-command-modifier 'meta)

;; thanks be to god
(global-set-key (kbd "<escape>") 'god-local-mode)
(global-set-key (kbd "M-SPC") 'god-local-mode)
(define-key god-local-mode-map (kbd "i") 'god-local-mode)
(define-key god-local-mode-map (kbd ".") 'repeat)
(define-key isearch-mode-map (kbd "<escape>") 'god-mode-isearch-activate)
(define-key god-mode-isearch-map (kbd "<escape>") 'god-mode-isearch-disable)

;; helm
(global-set-key (kbd "M-x") 'helm-M-x)
(global-set-key (kbd "C-M-b") 'helm-buffers-list)
(global-set-key (kbd "C-M-f") 'helm-projectile-find-file)
(global-set-key (kbd "C-M-y") 'helm-show-kill-ring)

;; Magit
(global-set-key (kbd "C-M-g") 'magit-status)

;; multiple cursors
(global-set-key (kbd "M-d") 'mc/mark-next-like-this)
(global-set-key (kbd "M-D") 'mc/mark-previous-like-this)

;; markdown preview
(global-set-key (kbd "C-M-p") 'markdown-grip)
(global-set-key (kbd "C-M-k") 'markdown-grip-kill)

;; helpers
(global-set-key (kbd "M-n") 'jump-down-5)
(global-set-key (kbd "M-p") 'jump-up-5)
(global-set-key (kbd "M-W") 'toggle-truncate-lines)
(global-set-key (kbd "M-=") 'text-scale-increase)
(global-set-key (kbd "M--") 'text-scale-decrease)
(global-set-key (kbd "M-]") 'indent-rigidly-right-to-tab-stop)
(global-set-key (kbd "M-[") 'indent-rigidly-left-to-tab-stop)
(global-set-key (kbd "M-z") 'undo)

;; (global-set-key (kbd "C-c") 'quit)
;; (global-set-key (kbd "M-p") 

