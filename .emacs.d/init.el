;; Transparency

;;(set-frame-parameter (selected-frame) 'alpha '(<active> . <inactive>))
;;(set-frame-parameter (selected-frame) 'alpha <both>)
(set-frame-parameter (selected-frame) 'alpha '(95 . 50))
(add-to-list 'default-frame-alist '(alpha . (95 . 50)))

;;disable toolbar and menubar
(tool-bar-mode -1)
(menu-bar-mode -1)

;; Package Management
(require 'package)
(add-to-list 'package-archives '("org" , "http://orgmode.org/elpa/"))
;;(add-to-list 'package-archives '("melpa-stable" , "http://stable.melpa.org/packages/"))
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/"))

(package-initialize)

;;Font
(set-face-attribute 'default nil
                    :family "Inconsolata"
                    :height 130
                    :weight 'normal
                    :width 'normal)

;;Powerline
(require 'powerline)
(powerline-default-theme)

;;Line numbers
(global-linum-mode 1)

;;New Terminal
(global-set-key (kbd "C-c s") '(lambda ()  (interactive) (ansi-term "/bin/zsh")))

;;Racket Mode
(require 'racket-mode)

;;rainbow delimiters
(add-hook 'racket-mode-hook #'rainbow-delimiters-mode)
(add-hook 'racket-repl-mode-hook #'rainbow-delimiters-mode)
(add-hook 'elpy-mode-hook #'rainbow-delimiters-mode)
(add-hook 'prog-mode-hook #'rainbow-delimiters-mode)

;;org-mode
(require 'org)
(define-key global-map "\C-cl" 'org-store-link)
(define-key global-map "\C-ca" 'org-agenda)
(setq org-log-done t)

;; Haskell
(add-hook 'haskell-mode-hook #'hindent-mode)

;;loading dracula theme
(load-theme 'dracula t)

;;enable python elpy
(elpy-enable)

;; smartparens
(require 'smartparens-config)
(smartparens-global-mode t)

;;(add-hook 'python-mode-hook 'anaconda-mode)  ;;more awesomeness
;;(add-hook 'python-mode-hook 'anaconda-eldoc-mode)  ;;docs

;;smex
(require 'smex)
(smex-initialize)
;;smex keybinding
(global-set-key (kbd "M-x") 'smex)
(global-set-key (kbd "M-X") 'smex-major-mode-commands)
;;old M-x.
(global-set-key (kbd "C-c C-c M-x") 'execute-extended-command)

;;comment region
(global-set-key (kbd "C-;") 'comment-or-uncomment-region)

;;text scaling
(global-set-key (kbd "C-+") 'text-scale-increase)
(global-set-key (kbd "C--") 'text-scale-decrease)

;;switching windows
(global-set-key (kbd "C-c <left>")  'windmove-left)
(global-set-key (kbd "C-c <right>") 'windmove-right)
(global-set-key (kbd "C-c <up>")    'windmove-up)
(global-set-key (kbd "C-c <down>")  'windmove-down)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   (quote
    ("84d2f9eeb3f82d619ca4bfffe5f157282f4779732f48a5ac1484d94d5ff5b279" "3c83b3676d796422704082049fc38b6966bcad960f896669dfc21a7a37a748fa" "345f8f92edc3508574c61850b98a2e0a7a3f5ba3bb9ed03a50f6e41546fe2de0" default))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
(put 'erase-buffer 'disabled nil)
