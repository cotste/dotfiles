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


;; Theme
(add-to-list 'custom-theme-load-path (expand-file-name "~/.emacs.d/themes/"))
(use-package nord-theme
  :ensure t)
(use-package gruvbox-theme
  :ensure t)
(load-theme 'gruvbox t)


;; Org
(use-package org)
(setq org-hide-emphasis-markers t)
(setq org-startup-indented t)
(setq org-log-done 'time)
(setq org-log-done 'note)
(add-hook 'org-mode-hook 'visual-line-mode)
(add-hook 'org-mode-hook (lambda () (linum-mode 0)))

(use-package org-bullets
	:config
	(add-hook 'org-mode-hook (lambda () (org-bullets-mode 1))))

(let* ((variable-tuple
        (cond ((x-list-fonts "Source Sans Pro") '(:font "Source Sans Pro"))
              ((x-list-fonts "Lucida Grande")   '(:font "Lucida Grande"))
              ((x-list-fonts "Verdana")         '(:font "Verdana"))
              ((x-family-fonts "Sans Serif")    '(:family "Sans Serif"))
              (nil (warn "Cannot find a Sans Serif Font.  Install Source Sans Pro."))))
       (base-font-color     (face-foreground 'default nil 'default))
       (headline           `(:inherit default :weight bold :foreground ,base-font-color)))

	(custom-theme-set-faces
	 'user
	 `(org-level-8 ((t (,@headline ,@variable-tuple))))
	 `(org-level-7 ((t (,@headline ,@variable-tuple))))
	 `(org-level-6 ((t (,@headline ,@variable-tuple))))
	 `(org-level-5 ((t (,@headline ,@variable-tuple))))
	 `(org-level-4 ((t (,@headline ,@variable-tuple :height 1.1))))
	 `(org-level-3 ((t (,@headline ,@variable-tuple :height 1.25))))
	 `(org-level-2 ((t (,@headline ,@variable-tuple :height 1.5))))
	 `(org-level-1 ((t (,@headline ,@variable-tuple :height 1.75))))
	 `(org-document-title ((t (,@headline ,@variable-tuple :height 2.0 :underline nil))))))

;; Evil Mode
;;(require  'evil)
(use-package evil
  :ensure t)
(evil-mode 1)
(setq evil-emacs-state-modes (delq 'ibuffer-mode evil-emacs-state-modes))

;; Git
;;(use-package diff-hl
;;:config
;;(add-hook 'progmode-hook 'turn-on-diff-hl-mode)
;;(add-hook 'vc-dir-mode-hook 'turn-on-diff-hl-mode))

(use-package magit
  :bind
  ("C-x g" . magit-status)

  :config
  (use-package evil-magit)
  (use-package with-editor)
  (setq magit-push-always-verify nil)
  (setq git-commit-summmary-max-length 50)

  (add-hook 'with-editor-mode-hook 'evil-insert-state))

;; Programming
(setq-default tab-width 2)

;; Company
(use-package company)
(add-hook 'after-init-hook 'global-company-mode)
(global-set-key (kbd "M-<space>") 'company-complete-common)

;; Python
(setq python-shell-interpreter "python3")
(use-package python-mode)

(use-package elpy)
(elpy-enable)
(add-hook 'elpy-mode-hook 'flycheck-mode)

(use-package py-autopep8)
(require 'py-autopep8)
(add-hook 'elpy-mode-hook 'py-autopep8-enable-on-save)

(use-package company-jedi)
(add-to-list 'company-backends 'company-jedi)

(add-hook 'python-mode-hook 'jedi:setup)
(setq jedi:complete-on-dot t)

;; Misc
(tool-bar-mode -1)
(menu-bar-mode -1)
(scroll-bar-mode -1)
(setq inhibit-splash-screen t)

(setq scroll-conservatively 100)
(setq ring-bell-function 'ignore)

(global-display-line-numbers-mode)

(transient-mark-mode 1)

;; Fonts
(add-to-list 'default-frame-alist
						 '(font . "Source Code Pro"))


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
		("78c1c89192e172436dbf892bd90562bc89e2cc3811b5f9506226e735a953a9c6" "487cfc75d735a297baceb6e531b3de722a587ae73b301250382964d9ae13939f" "76c5b2592c62f6b48923c00f97f74bcb7ddb741618283bdb2be35f3c0e1030e3" "7f6d4aebcc44c264a64e714c3d9d1e903284305fd7e319e7cb73345a9994f5ef" default)))
 '(package-selected-packages
	 (quote
		(org-bullets gruvbox-theme powerline org-chef base16-theme py-autopep8 elpy python-mode company evil-magit diff-hl aggressive-indent zenburn-theme nord-theme evil))))

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(org-document-title ((t (:inherit default :weight bold :foreground "#fdf4c1" :family "Sans Serif" :height 2.0 :underline nil))))
 '(org-level-1 ((t (:inherit default :weight bold :foreground "#fdf4c1" :family "Sans Serif" :height 1.75))))
 '(org-level-2 ((t (:inherit default :weight bold :foreground "#fdf4c1" :family "Sans Serif" :height 1.5))))
 '(org-level-3 ((t (:inherit default :weight bold :foreground "#fdf4c1" :family "Sans Serif" :height 1.25))))
 '(org-level-4 ((t (:inherit default :weight bold :foreground "#fdf4c1" :family "Sans Serif" :height 1.1))))
 '(org-level-5 ((t (:inherit default :weight bold :foreground "#fdf4c1" :family "Sans Serif"))))
 '(org-level-6 ((t (:inherit default :weight bold :foreground "#fdf4c1" :family "Sans Serif"))))
 '(org-level-7 ((t (:inherit default :weight bold :foreground "#fdf4c1" :family "Sans Serif"))))
 '(org-level-8 ((t (:inherit default :weight bold :foreground "#fdf4c1" :family "Sans Serif")))))
;; Powerline
(use-package powerline
	:ensure t)
(powerline-center-evil-theme)

;; Recipes
(use-package org-chef
	:ensure t)

;; Org Capture Templates
(setq org-capture-templates
			'(("c" "Cookbook" entry (file "~/org/cookbook.org")
				 "%org-chef-get-recipe-from-url)"
				 :empty-lines 1)
				("m" "Manual Cookbook" entry (file "~/org/cookbook.org")
				 "* %^{Recipe title: }\n :PROPERTIES:\n :source-url:\n :servings:\n :prep-time:\n :cook-time:\n :ready-in:\n :END:\n** Ingredients\n  %?\n** Directions\n\n"))
			)
