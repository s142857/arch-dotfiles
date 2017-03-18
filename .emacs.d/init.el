
;;;;  Package Management  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(require 'package)
(add-to-list 'package-archives '("org" , "http://orgmode.org/elpa/"))
;;(add-to-list 'package-archives '("melpa-stable" , "http://stable.melpa.org/packages/"))
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/"))
(add-to-list 'package-archives
             '("elpy" . "http://jorgenschaefer.github.io/packages/"))

(package-initialize)


;;;;  appearance  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; disable toolbar and menubar
(tool-bar-mode -1)
(menu-bar-mode -1)

;; Font
(set-face-attribute 'default nil
                    :family "Inconsolata" ; Inconsolata is ♥
                    :height 110
                    :weight 'normal
                    :width 'normal)

;; Themes
(if (display-graphic-p) 
    (load-theme 'dracula t)
  (load-theme 'zenburn))
(setq custom-safe-themes t)

;;Powerline
(require 'powerline)
(powerline-default-theme)

;;Line numbers
(global-linum-mode 1)

;; Visual Line mode
(global-visual-line-mode 1)


;;;;;  smex  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

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


;;;;;  TeX  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; 

;;Tex
(require 'cl)

;; Latex
(require 'latex)
(add-hook 'LaTeX-mode-hook #'flyspell-mode)
(add-hook 'LaTeX-mode-hook #'auto-complete-mode)
(add-hook 'LaTeX-mode-hook #'latex-math-mode)
(setq TeX-save-query nil)
(define-key LaTeX-mode-map (kbd "S-<return>") 'TeX-command-run-all)

;; Unbinding C-z
(global-unset-key [(control z)])
(global-unset-key [(control x)(control z)])
(global-set-key [(control z)] 'undo)

;; Sloppy hands!
(global-unset-key [(control x)(control c)])

;; Latex shortcuts
(define-key LaTeX-mode-map (kbd "C-c f") 'LaTeX-math-frac)
(define-key LaTeX-mode-map (kbd "C-c z") "\\mathbb{Z}")
(define-key LaTeX-mode-map (kbd "C-c n") "\\mathbb{N}")
(define-key LaTeX-mode-map (kbd "C-c r") "\\mathbb{R}")
(define-key LaTeX-mode-map (kbd "C-c c") "\\mathbb{C}")
(define-key LaTeX-mode-map (kbd "C-c i") 'LaTeX-math-implies)
(define-key LaTeX-mode-map (kbd "C-c a") 'LaTeX-math-forall)
(define-key LaTeX-mode-map (kbd "C-c e") 'LaTeX-math-exists)
(define-key LaTeX-mode-map (kbd "` 2") "^{2}")
(define-key LaTeX-mode-map (kbd "` 3") "^{3}")
(define-key LaTeX-mode-map (kbd "` t") "\dagger")
(define-key LaTeX-mode-map (kbd "C-c d") "\\frac{dy}{dx}")
(define-key LaTeX-mode-map (kbd "C-c m") "\\lim_{n \\rightarrow \infty}")
(define-key LaTeX-mode-map (kbd "C-c h") "\\lim_{h \\rightarrow 0}")
(define-key LaTeX-mode-map (kbd "C-c (") "\\left(")
(define-key LaTeX-mode-map (kbd "C-c 0") "_{0}")
(define-key LaTeX-mode-map (kbd "C-c q") "\\hfill \\ensuremath \\square")


;;;;;  General Programming  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; smartparens
(require 'smartparens-config)
(smartparens-global-mode t)
