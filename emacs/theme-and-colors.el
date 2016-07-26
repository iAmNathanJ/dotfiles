;; make it pretty
(load-theme 'dracula t)
(custom-set-faces
 '(default ((t (:inherit nil :stipple nil :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight normal :height 130 :width normal :foundry "nil" :family "Monaco")))))

;; line numbers
;; (custom-set-variables '(linum-format (quote "%4d ")))
(setq linum-format " %d ")
(set-face-foreground 'linum "#6272a4")

;; diff-hl colors
(set-face-foreground 'diff-hl-change "#447799")
(set-face-background 'diff-hl-change "#447799")
(set-face-foreground 'diff-hl-insert "#99ad6a")
(set-face-background 'diff-hl-insert "#99aa6a")
(set-face-foreground 'diff-hl-delete "#aa2222")
(set-face-background 'diff-hl-delete "#aa2222")
