(setq user-full-name "Kristian Puccio")
(setq user-mail-address "kristian.puccio@gmail.com")

(setenv "GOPATH" "/Users/kristian/Documents/Development/go")

;; Ask "y" or "n" instead of "yes" or "no". Yes, laziness is great.
(fset 'yes-or-no-p 'y-or-n-p)

;; Highlight corresponding parentheses when cursor is on one
(show-paren-mode t)

;; Highlight tabulations
(setq-default highlight-tabs t)

;; Show trailing white spaces
;(setq-default show-trailing-whitespace t)

;; Remove useless whitespace before saving a file
(add-hook 'before-save-hook 'whitespace-cleanup)
(add-hook 'before-save-hook (lambda() (delete-trailing-whitespace)))

;;;; this loads the package manager
(require 'package)

;;;; here these's a variable named package-archives, and we're adding the MELPA repository to it
(add-to-list 'package-archives
         '("melpa" . "http://melpa.milkbox.net/packages/") t)


;;;; loads packages and actives them
(package-initialize)

;; load the theme
(load-theme 'solarized-dark t)

;; set the font
;; (set-default-font "-apple-Source_Code_Pro-medium-normal-normal-*-16-*-*-*-m-0-iso10646-1")

;; show line numbers
(global-linum-mode t)
(column-number-mode 1)

;; highlight the current line
(global-hl-line-mode t)

 ;; scroll one line at a time (less "jumpy" than defaults)
(setq mouse-wheel-scroll-amount '(1 ((shift) . 1))) ;; one line at a time
;; (setq mouse-wheel-progressive-speed 't) ;; don't accelerate scrolling
;; (setq mouse-wheel-follow-mouse 't) ;; scroll window under mouse
;; (setq scroll-step 1) ;; keyboard scroll one line at a time

;; thin cursor - should I keep?
;; (setq-default cursor-type 'bar)


;; Use switch-window
(global-set-key (kbd "C-x o") 'switch-window)


;; (require 'ido)
;; (global-ido-mode﻿ t)
;; (setq ido-enable-flex-matching t)

;; (require 'evil)
(evil-mode 1)

;; (require 'go-autocomplete)
;; (require 'auto-complete-config)

;; (require 'go-direx)
;; (require 'go-eldoc)
(add-hook 'go-mode-hook 'go-eldoc-setup)
(add-hook 'go-mode-hook 'company-mode)
(add-hook 'go-mode-hook (lambda ()
                (set (make-local-variable 'company-backends) '(company-go))
                  (company-mode)))


(when (memq window-system '(mac ns))
  (exec-path-from-shell-initialize))


;; Set tabs to have width of 4
(setq-default indent-tabs-mode nil)
(setq-default tab-width 4)
(setq indent-line-function 'insert-tab)


(setq company-idle-delay 0.1)


(require 'neotree)
(global-set-key [f8] 'neotree-toggle)

;;(add-hook 'neotree-mode-hook
;;          (lambda ()
;;            (define-key evil-normal-state-local-map (kbd "TAB") 'neotree-enter)
;;            (define-key evil-normal-state-local-map (kbd "SPC") 'neotree-enter)
;;            (define-key evil-normal-state-local-map (kbd "q") 'neotree-hide)
;;            (define-key evil-normal-state-local-map (kbd "RET") 'neotree-enter)))
(evil-set-initial-state 'neotree-mode 'emacs)
