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
(require 'neotree)
(require 'winring)

;; modes and stuff
(add-to-list 'auto-mode-alist '("\\.html?\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.hbs?\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.php?\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.svg?\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.js?\\'" . js2-mode))
(add-to-list 'auto-mode-alist '("\\.jsx?\\'" . js2-mode))
(add-to-list 'interpreter-mode-alist '("node" . js2-mode))
(add-to-list 'auto-mode-alist '("\\.json?\\'" . json-mode))
(add-to-list 'auto-mode-alist '("\\.scss\\'" . scss-mode))
(add-to-list 'auto-mode-alist '("\\.md\\'" . gfm-mode))
(add-hook 'gfm-mode-hook (lambda () (orgtbl-mode 1)))

;;  defaults
(blink-cursor-mode -1)
(scroll-bar-mode -1)
(tool-bar-mode -1)
(setq-default truncate-lines 1)
(global-auto-revert-mode t) 
(setq inhibit-startup-message t)
(setq make-backup-files nil)
(setq auto-save-default nil)
(setq-default indent-tabs-mode nil)
(setq-default tab-width 2)
(setq web-mode-markup-indent-offset 2)
(setq-default c-basic-offset 2)
(setq-default css-indent-offset 2)
(setq-default coffee-tab-width 2)
(setq confirm-kill-emacs 'yes-or-no-p)
(global-linum-mode t)
(setq ring-bell-function 'ignore)

;; helm
(add-to-list 'projectile-globally-ignored-directories "node_modules")

;; show key options
(which-key-mode)

;; winring
(winring-initialize)

;; git diffs
(global-diff-hl-mode)
(add-hook 'diff-hl-mode-hook 'diff-hl-margin-mode)
(set-variable 'diff-hl-side 'right)

;; auto-complete
(ac-config-default)

;; muti-term
(setq multi-term-program "/bin/zsh")

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

(load "~/.dotfiles/emacs/theme-and-colors.el")
(load "~/.dotfiles/emacs/god-mode.el")
(load "~/.dotfiles/emacs/markdown-preview.el")
(load "~/.dotfiles/emacs/convenience.el")
(load "~/.dotfiles/emacs/key-bindings.el")

