;; encoding
(when (eq system-type 'windows-nt)
  (setq default-process-coding-system '(utf-8-dos . cp1251-dos)))

;; fullscreen on startup
(add-to-list 'default-frame-alist '(fullscreen . maximized))

;; main font
(set-frame-font "Iosevka-13")

;; buffer on startup
'(initial-buffer-choice "*scratch*")

(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
;; Comment/uncomment this line to enable MELPA Stable if desired.  See `package-archive-priorities`
;; and `package-pinned-packages`. Most users will not need or want to do this.
;;(add-to-list 'package-archives '("melpa-stable" . "https://stable.melpa.org/packages/") t)
(package-initialize)

;; -->  all plugins here <--

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-enabled-themes nil)
 '(global-display-line-numbers-mode t)
 '(indent-tabs-mode t)
 '(initial-buffer-choice t)
 '(menu-bar-mode nil)
 '(package-selected-packages
   '(company dap-mode flycheck go-mode lsp-mode lsp-treemacs php-mode
			 use-package which-key yasnippet))
 '(scroll-bar-mode nil)
 '(tab-bar-mode nil)
 '(tab-width 4)
 '(tool-bar-mode nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
