(require 'package)

(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/"))
(add-to-list 'package-archives '("melpa-stable" . "https://stable.melpa.org/elpa/"))
(add-to-list 'package-archives '("org" . "https://orgmode.org/elpa/"))

(package-initialize)

(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(eval-when-compile
  (require 'use-package))

(require 'use-package-ensure)
(setq use-package-always-ensure t)

(setq inhibit-splash-screen t)

(transient-mark-mode 1)

;; Org
(require 'org)
(setq org-startup-indented t)
(setq org-log-done 'time)
(setq org-log-done 'note)

;; Evil Mode
;;(require  'evil)
(use-package evil
  :ensure t)
(evil-mode 1)
(setq evil-emacs-state-modes (delq 'ibuffer-mode evil-emacs-state-modes))

;; Git
(use-package diff-hl
  :config
  (add-hook 'progmode-hook 'turn-on-diff-hl-mode)
  (add-hook 'vc-dir-mode-hook 'turn-on-diff-hl-mode))

(use-package magit
  :bind
  ("C-x g" . magit-status)

  :config
  (use-package evil-magit)
  (use-package with-editor)
  (setq magit-push-always-verify nil)
  (setq git-commit-summmary-max-length 50)

  (add-hook 'with-editor-mode-hook 'evil-insert-state))

;; Misc
(tool-bar-mode -1)
(menu-bar-mode -1)
(scroll-bar-mode -1)

(setq scroll-conservatively 100)

;; Fonts
(add-to-list 'default-frame-alist
	     '(font . "Inconsolata-14"))

;; Theme
(add-to-list 'custom-theme-load-path (expand-file-name "~/.emacs.d/themes/"))

(load-theme 'nord t)


;; Indentation
(global-aggressive-indent-mode 1)
(add-to-list 'aggressive-indent-excluded-modes 'html-mode)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   (quote
    ("7f6d4aebcc44c264a64e714c3d9d1e903284305fd7e319e7cb73345a9994f5ef" default)))
 '(package-selected-packages
   (quote
    (evil-magit diff-hl aggressive-indent zenburn-theme nord-theme evil))))

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

