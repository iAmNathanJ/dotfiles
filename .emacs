(require 'package)
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/"))
(package-initialize)

; fix path issues
(when (memq window-system '(mac ns))
  (exec-path-from-shell-initialize))

(require 'org)
(require 'god-mode)
(require 'helm)
(require 'helm-projectile)
(require 'diff-hl)

;diff-hl changes
(set-face-foreground 'diff-hl-change "#447799")
(set-face-background 'diff-hl-change "#447799")
(set-face-foreground 'diff-hl-insert "#99ad6a")
(set-face-background 'diff-hl-insert "#99ad6a")
(set-face-foreground 'diff-hl-delete "#aa2222")
(set-face-background 'diff-hl-delete "#aa2222")


;(setq markdown-command "marked")
(defun turn-on-orgtbl () (orgtbl-mode 1))
(add-to-list 'auto-mode-alist '("\\.md\\'" . gfm-mode))
(add-hook 'gfm-mode-hook 'turn-on-orgtbl)

(which-key-mode)

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

; kill defaults
(blink-cursor-mode -1)
(scroll-bar-mode -1)
(tool-bar-mode -1)
(setq-default truncate-lines 1)
(global-auto-revert-mode 1)
(setq inhibit-startup-message t)

; git diffs via diff-hl
(global-diff-hl-mode)

; make it pretty
(load-theme 'jbeans t)
(setq linum-format " %d ")
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:inherit nil :stipple nil :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight normal :height 130 :width normal :foundry "nil" :family "Monaco")))))

(global-linum-mode t)
(setq-default indent-tabs-mode nil)
(setq-default tab-width 2)
(setq-default css-indent-offset 2)

;default auto-complete
(ac-config-default)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   (quote
    ("a6a3e2a5c14c8b6365914cf0bd5592f2c428a6b7ec39bda60dcab55843fb5da2" . t)))
 '(safe-local-variable-values
   (quote
    ((eval when
           (require
            (quote rainbow-mode)
            nil t)
           (rainbow-mode 1)))))
 '(split-height-threshold nil)
 '(split-width-threshold 0))

; Key Bindings
(defun jump-down-5 ()
  (interactive)
  (next-line 5))

(defun jump-up-5 ()
  (interactive)
  (next-line -5))

(setq multi-term-program "/bin/zsh")

(load "~/code/dotfiles/emacs/key-bindings.el")
