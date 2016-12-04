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
(add-to-list 'package-archives
             '("elpy" . "http://jorgenschaefer.github.io/packages/"))

(package-initialize)

;;Fontg
(set-face-attribute 'default nil
                    :family "Inconsolata" ; Inconsolata is ♥
                    :height 120
                    :weight 'normal
                    :width 'normal)

;;Tex
(require 'cl)

;;Powerline
(require 'powerline)
(powerline-default-theme)

;;Line numbers
(global-linum-mode 1)

;; Visual Line mode
(global-visual-line-mode 1)

;;Racket Mode
(require 'racket-mode)

;;rainbow delimiters
(add-hook 'racket-mode-hook #'rainbow-delimiters-mode)
(add-hook 'racket-repl-mode-hook #'rainbow-delimiters-mode)
(add-hook 'elpy-mode-hook #'rainbow-delimiters-mode)
(add-hook 'prog-mode-hook #'rainbow-delimiters-mode)
(define-key racket-mode-map (kbd "C-c C-c") 'racket-test)

;;org-mode
(require 'org)
(define-key global-map "\C-cl" 'org-store-link)
(define-key global-map "\C-ca" 'org-agenda)
(setq org-log-done t)

;; Colour terminals
(setq ansi-color-for-comint-mode t)
;; python
(setq python-shell-interpreter "ipython"
    python-shell-interpreter-args "--simple-prompt -i")

;; Haskell
(add-hook 'haskell-mode-hook #'hindent-mode)

;; C++ development
(require 'rtags) ;; optional, must have rtags installed
(cmake-ide-setup)

;; Themes
(if (display-graphic-p) 
    (load-theme 'dracula)
  (load-theme 'zenburn))

(add-to-list 'custom-theme-load-path "~/.emacs.d/blackboard-theme.el"); My third favourite theme

;;enable python elpy
(elpy-enable)

;; smartparens
(require 'smartparens-config)
(smartparens-global-mode t)

;;(add-hook 'python-mode-hook 'anaconda-mode)  ;;more awesomeness
;;(add-hook 'python-mode-hook 'anaconda-eldoc-mode)  ;;docs

;; smex
(require 'smex)
(smex-initialize)
;; smex keybinding
(global-set-key (kbd "M-x") 'smex)
(global-set-key (kbd "M-X") 'smex-major-mode-commands)
;; old M-x.
(global-set-key (kbd "C-c C-c M-x") 'execute-extended-command)

;; comment region
(global-set-key (kbd "C-;") 'comment-or-uncomment-region)

;; text scaling
(global-set-key (kbd "C-+") 'text-scale-increase)
(global-set-key (kbd "C--") 'text-scale-decrease)

;;switching windows
(global-set-key (kbd "C-c <left>")  'windmove-left)
(global-set-key (kbd "C-c <right>") 'windmove-right)
(global-set-key (kbd "C-c <up>")    'windmove-up)
(global-set-key (kbd "C-c <down>")  'windmove-down)

;; Latex
(require 'latex)
(add-hook 'LaTeX-mode-hook #'flyspell-mode)
(add-hook 'LaTeX-mode-hook #'auto-complete-mode)

;; Unbinding C-z
(global-unset-key [(control z)])
(global-unset-key [(control x)(control z)])
(global-set-key [(control z)] 'undo)

;; Latex shortcuts
(define-key LaTeX-mode-map (kbd "C-c f") 'LaTeX-math-frac)
(define-key LaTeX-mode-map (kbd "C-c b") "\\textbf{}")
(define-key LaTeX-mode-map (kbd "C-c z") "\\mathbb{Z}")
(define-key LaTeX-mode-map (kbd "C-c n") "\\mathbb{N}")
(define-key LaTeX-mode-map (kbd "C-c r") "\\mathbb{R}")
(define-key LaTeX-mode-map (kbd "C-c c") "\\mathbb{C}")
(define-key LaTeX-mode-map (kbd "C-c i") 'LaTeX-math-implies)
(define-key LaTeX-mode-map (kbd "C-c a") 'LaTeX-math-forall)
(define-key LaTeX-mode-map (kbd "C-c e") 'LaTeX-math-exists)
(define-key LaTeX-mode-map (kbd "C-c 2") "^{2}")
(define-key LaTeX-mode-map (kbd "C-c 3") "^{3}")
(define-key LaTeX-mode-map (kbd "C-c e") 'LaTeX-math-epsilon)
(define-key LaTeX-mode-map (kbd "C-c d") "\\frac{dy}{dx}") ;'LaTeX-math-delta
(define-key LaTeX-mode-map (kbd "C-c l") 'LaTeX-math-lambda)
(define-key LaTeX-mode-map (kbd "C-c m") "\\lim_{x \\rightarrow a}")
(define-key LaTeX-mode-map (kbd "C-c h") "\\lim_{h \\rightarrow 0}")
(define-key LaTeX-mode-map (kbd "C-c (") "\\left(")
(define-key LaTeX-mode-map (kbd "C-c 0") "_{0}")
(define-key LaTeX-mode-map (kbd "C-c q") "\\hfill \\ensuremath \\square")
(define-key LaTeX-mode-map (kbd "C-c p") 'LaTeX-math-partial)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   (quote
    ("f641bdb1b534a06baa5e05ffdb5039fb265fde2764fbfd9a90b0d23b75f3936b" "427fed191e7a766152e59ef0e2904283f436dbbe259b9ccc04989f3acde50a55" "0e219d63550634bc5b0c214aced55eb9528640377daf486e13fb18a32bf39856" "84d2f9eeb3f82d619ca4bfffe5f157282f4779732f48a5ac1484d94d5ff5b279" "3c83b3676d796422704082049fc38b6966bcad960f896669dfc21a7a37a748fa" "345f8f92edc3508574c61850b98a2e0a7a3f5ba3bb9ed03a50f6e41546fe2de0" default)))
 '(package-selected-packages
   (quote
    (blackboard-bold-mode python-django twittering-mode soundcloud auctex-latexmk auto-complete-auctex auto-complete latex-extra zenburn-theme cmake-ide rtags ggtags rainbow-delimiters smex smartparens racket-mode powerline haskell-mode elpy dracula-theme))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(racket-selfeval-face ((t (:foreground "medium spring green")))))
(put 'erase-buffer 'disabled nil)
