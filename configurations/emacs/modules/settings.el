;; -*- lexical-binding: t; -*-

;;-----------------------------------------------------------------------------
;;; Genearal setting
;;-----------------------------------------------------------------------------
;; tablature settings
(setq tab-width 2)
(setq tab-always-intent 'complete) ;; if the line is already indented execute the TAB action

;; encoding system
(set-language-environment "UTF-8")
(set-default-coding-systems 'utf-8)
(set-terminal-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)
;; backwards compatibility as default-buffer-file-coding-system
;; is deprecated in 23.2.
(if (boundp 'buffer-file-coding-system)
    (setq-default buffer-file-coding-system 'utf-8)
  (setq default-buffer-file-coding-system 'utf-8))

;; Treat clipboard input as UTF-8 string first; compound text next, etc.
(setq x-select-request-type '(UTF8_STRING COMPOUND_TEXT TEXT STRING))

;; load path
(add-to-list 'load-path (concat lm/conf-dir "lisp/"))

;; autosaves, junk files and custom configuration
(setq backup-inhibited t)
(setq auto-save-default nil)
(setq create-lockfiles nil)
(setq custom-file (concat lm/conf-dir "/emacs-custom.el"))

;; automatically refresh the buffer when the correspondig file has been changed
;; externally
(global-auto-revert-mode t)

;; remove dired buffers or those surrounded by * from cycling
(set-frame-parameter (selected-frame) 'buffer-predicate
                       (lambda (buf) 
			 (let ((name (buffer-name buf)))
                           (not (or (string-prefix-p "*" name)
                                    (eq 'dired-mode (buffer-local-value 'major-mode buf)))))))

;; auto pairs parenthesis
(add-hook 'prog-mode-hook 'electric-pair-mode)

;; avoid noises messages
(setq inhibit-startup-message t)                              ;; no startup screen
(setq message-kill-buffer-query nil)                          ;; no prompt kill buffer
(setq use-short-answers t)

;; enable mouse menu
(context-menu-mode)

;; fido mode
(setq completion-ignore-case t) ;; fido search is case insensitive
(fido-vertical-mode t)

;;------------------------------------------------------------------------------
;;; Rows and columns
;;-----------------------------------------------------------------------------
(column-number-mode)

(setq display-line-numbers-type 'relative)
(global-display-line-numbers-mode)
(dolist (mode '(org-mode-hook
		markdown-mode-hook
		term-mode-hook
		vterm-mode-hook
		shell-mode-hook
		eshell-mode-hook
		latex-mode-hook
		treemacs-mode-hook
		eww-mode-hook
		))
  (add-hook mode (lambda () (display-line-numbers-mode 0))))

(setq-default fill-column 80)
;; (global-display-fill-column-indicator-mode)
;; (dolist (mode '(term-mode-hook
;; 		vterm-mode-hook
;; 		shell-mode-hook
;; 		eshell-mode-hook
;; 		latex-mode-hook
;; 		org-mode-hook
;; 		markdown-mode-hook))
;;   (add-hook mode (lambda () (display-fill-column-indicator-mode 0))))

(if (display-graphic-p)
    (global-hl-line-mode))


;;------------------------------------------------------------------------------
;;; Windows and Geometry
;;-----------------------------------------------------------------------------
(setq default-frame-alist '((width . 110)
			    (height . 35)
			    (alpha . (100 . 100))))

;; disable scroll-bar even in new frames
(add-to-list 'default-frame-alist
	     '(vertical-scroll-bars . nil))

;; window title as [filename mode-name]
(setq-default frame-title-format '("%f [" mode-name "]"))

;;-----------------------------------------------------------------------------
;;; Scrolling
;;-----------------------------------------------------------------------------

;; ;; (setq scroll-margin 5)
;; ;; (setq scroll-conservatively scroll-margin)
;; (setq scroll-conservatively 10000)
;; (setq scroll-preserve-screen-position t)
;; (setq mouse-wheel-follow-mouse 't)
;; (setq mouse-wheel-scroll-amount '(1 ((shift) . 1) ((control) . nil)))
;; (setq scroll-step 1)
;; (setq auto-window-vscroll nil)
;; (setq scroll-error-top-bottom t)
;; (setq mouse-wheel-progressive-speed nil)
;; (setq mouse-wheel-inhibit-click-time nil)
(setq fast-but-imprecise-scrolling t)
(setq redisplay-dont-pause t)
(pixel-scroll-precision-mode)
