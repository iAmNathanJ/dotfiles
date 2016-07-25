(require 'package)
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/"))
(package-initialize)

;; fix path issues
(when (memq window-system '(mac ns))
  (exec-path-from-shell-initialize))

(require 'org)
(require 'god-mode)
(require 'god-mode-isearch)
(require 'helm)
(require 'helm-projectile)
(require 'web-mode)
(require 'diff-hl)
(require 'multiple-cursors)

(which-key-mode)

;; god-mode
(god-mode)

;; update cursor on god-mode
(defun god-cursor ()
  (set-cursor-color (if (or god-local-mode buffer-read-only) "#dd0093" "#ffffff")))

;; update modeline on god-mode
(defun c/god-mode-update-cursor ()
  (let ((limited-colors-p (> 257 (length (defined-colors)))))
    (cond (god-local-mode (progn
                            (set-face-background 'mode-line (if limited-colors-p "white" "#de5577"))
                            (set-face-background 'mode-line-inactive (if limited-colors-p "white" "#de5577"))))
          (t (progn
               (set-face-background 'mode-line (if limited-colors-p "black" "#6272a4"))
               (set-face-background 'mode-line-inactive (if limited-colors-p "black" "#6272a4")))))))

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

;; modes and stuff
(add-to-list 'auto-mode-alist '("\\.html?\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.hbs?\\'" . handlebars-mode))
(add-to-list 'auto-mode-alist '("\\.php?\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.js?\\'" . js2-mode))

(add-to-list 'auto-mode-alist '("\\.jsx?\\'" . js2-mode))
(add-to-list 'interpreter-mode-alist '("node" . js2-mode))
(add-to-list 'auto-mode-alist '("\\.json?\\'" . json-mode))
(add-to-list 'auto-mode-alist '("\\.scss\\'" . css-mode))

;; gfm-mode and orgtbl-mode  on markdown
(add-to-list 'auto-mode-alist '("\\.md\\'" . gfm-mode))
(add-hook 'gfm-mode-hook (lambda () (orgtbl-mode 1)))

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

;;  defaults
(blink-cursor-mode -1)
(scroll-bar-mode -1)
(tool-bar-mode -1)
(setq-default truncate-lines 1)
(global-auto-revert-mode 1)
(setq inhibit-startup-message t)
(setq make-backup-files nil)
(setq auto-save-default nil)
(setq-default indent-tabs-mode nil)
(setq-default tab-width 2)
(setq-default c-basic-offset 2)
(setq-default css-indent-offset 2)
(setq confirm-kill-emacs 'yes-or-no-p)

(global-linum-mode t)
(custom-set-variables '(linum-format (quote "%4d ")))
(set-face-foreground 'linum "goldenrod3")

;; git diffs via diff-hl
(global-diff-hl-mode)
(add-hook 'diff-hl-mode-hook 'diff-hl-margin-mode)
(set-variable 'diff-hl-side 'right)

;; diff-hl colors
(set-face-foreground 'diff-hl-change "#447799")
(set-face-background 'diff-hl-change "#447799")
(set-face-foreground 'diff-hl-insert "#99ad6a")
(set-face-background 'diff-hl-insert "#99aa6a")
(set-face-foreground 'diff-hl-delete "#aa2222")
(set-face-background 'diff-hl-delete "#aa2222")

;; make it pretty
(load-theme 'dracula t)
(custom-set-faces
 '(default ((t (:inherit nil :stipple nil :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight normal :height 130 :width normal :foundry "nil" :family "Monaco")))))

;; line numbers
(setq linum-format " %d ")
(set-face-foreground 'linum "#6272a4")

;; default auto-complete
(ac-config-default)

;; Customize
(custom-set-variables
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

(defun jump-down-5 ()
  (interactive)
  (next-line 5))

(defun jump-up-5 ()
  (interactive)
  (next-line -5))

(setq multi-term-program "/bin/zsh")

(load "~/code/dotfiles/emacs/key-bindings.el")
