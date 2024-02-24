(require 'package)
(setq package-enable-at-startup nil)
(add-to-list 'package-archives
	     '("melpa" . "https://melpa.org/packages/"))

(package-initialize)

(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(unless (package-installed-p 'catppuccin-theme)
  (package-refresh-contents)
  (package-install 'catppuccin-theme))

(setq next-line-add-newlines t)
(setq scroll-conservatively 180)
(setq ring-bell-function 'ignore)
(setq line-number-mode t)
(setq display-line-numbers-type 'relative)
(setq column-number-mode t)
(setq-default
    c-default-style "k&r"
    c-basic-offset 4)
(setq-default tab-width 4)
(setq indent-line-function 'insert-tab)
(setq electric-pair-pairs '(
			    (?\( . ?\))
			    (?\[ . ?\])
			    (?\{ . ?\})
			    (?\" . ?\")
			    (?\' . ?\')
			    ))

(setq backup-directory-alist
      `((".*" . ,temporary-file-directory)))
(setq auto-save-file-name-transforms
      `((".*" ,temporary-file-directory t)))

(add-hook 'prog-mode-hook 'display-line-numbers-mode)
(setq display-line-numbers 'relative)

(global-hl-line-mode t)
(global-subword-mode 1)

(use-package which-key
  :ensure t
  :init
  (which-key-mode))

(use-package beacon
  :ensure t
  :init
  (beacon-mode 1))

(use-package rainbow-delimiters
  :ensure t
  :init
  (rainbow-delimiters-mode 1))

(use-package dashboard
  :ensure t
  :config
  (dashboard-setup-startup-hook)
  (setq dashboard-items '((recents . 10)))
  (setq dashboard-banner-logo-title "hai :3")
  (setq dashboard-center-content t)
  (setq dashboard-startup-banner "~/.emacs.d/patchouli.png"))

(use-package mood-line
  :ensure t
  :config
  (mood-line-mode))

(use-package elcord
  :ensure t
  :init
  (elcord-mode 1))

(use-package lsp-mode
  :ensure t
  :init
  (setq lsp-keymap-prefix "C-c l"
        lsp-idle-delay 0.1)
  :hook ((c++-mode . clangd)
         (python-mode . lsp)
		 (c-mode . clangd)
		 (csharp-mode . omnisharp))
  :commands lsp)

(use-package lsp-ui
  :ensure t
  :init
  (lsp-ui-mode t))

(use-package yasnippet
  :ensure t
  :init)

(use-package company
  :ensure t
  :init
  (setq company-minimum-prefix-length 1
      company-idle-delay 0.0)
  (add-hook 'after-init-hook 'global-company-mode))

(use-package purple-haze-theme
  :ensure t
  :init)

(use-package sourcepawn-mode
  :ensure t
  :init)

(use-package typescript-mode
  :ensure t
  :init)

(use-package flycheck
  :ensure t
  :init
  (add-hook 'after-init-hook #'global-flycheck-mode))

(use-package editorconfig
  :ensure t
  :config
  (editorconfig-mode 1))

(use-package auto-package-update
   :ensure t
   :config
   (setq auto-package-update-delete-old-versions t
         auto-package-update-interval 72)
   (auto-package-update-maybe))

(use-package treemacs
  :ensure t)

(use-package lsp-treemacs
  :ensure t)

(electric-pair-mode t)
(tool-bar-mode -1)
(menu-bar-mode -1)
(ido-mode 1)
(when window-system (scroll-bar-mode -1))
(when window-system (global-prettify-symbols-mode t))

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-enabled-themes '(purple-haze))
 '(custom-safe-themes
   '("f5267eb209dbf6adf07a8eb66c658ed69eaabb8a76e61c9a5cee8e47a9025c0a" default))
 '(package-selected-packages
   '(treemacs smex auto-package-update yasnippet typescript-mode format-all editorconfig lsp-treemacs flycheck sourcepawn-mode purple-haze-theme mood-line company company-mode lsp-ui lsp-mode elcord spaceline dashboard rainbow-delimiters god-mode beacon catppuccin-theme which-key use-package)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:inherit nil :extend nil :stipple nil :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight normal :height 125 :width normal :foundry "outline" :family "Iosevka")))))
