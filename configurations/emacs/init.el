;; -*- lexical-binding: t -*-

(use-package emacs
  :bind
  (("C-x C-b" . 'ibuffer)
   ("C-z" . nil)
   ("C-x C-z" . nil))
  :custom
  ;; EDITING
  (indent-tabs-mode nil) ; use spaces instead of tabs for indenting
  (delete-selection-mode 1)
  (set-mark-command-repeat-pop t) ; So we can use C-u C-SPC C-SPC C-SPC... instead of C-u C-SPC C-u C-SPC...

  ;; USER INTERACTION
  (read-answer-short t)
  (use-short-answers t)
  (visible-bell nil)
  (ring-bell-function 'ignore)
  (inhibit-startup-message t)
  (initial-scratch-message "")

  ;; TAB
  (tab-always-indent 'complete)
  (tab-width 4)

  ;; COMPLETION
  (completion-ignore-case t)
  (completions-detailed t)
  (completions-max-height 20)
  (completion-styles '(partial-completion flex initials))
  (completions-format 'vertical)
  (completion-show-help t)
  (global-completion-preview-mode 1)

  ;; MODELINE
  (column-number-mode 1)

  ;; TAB BAR
  (tab-bar-close-button-show nil)
  (tab-bar-new-button-show nil)
  (tab-bar-tab-hints t)
  
  ;; WINDOW BEHAVIUOR
  (window-resize-pixelwise nil)    
  (help-window-select t)
  (split-width-threshold 170)     ; So vertical splits are preferred
  (split-height-threshold nil)

  ;; HISTORY AND BACKUP FILES
  (recentf-max-saved-items 300) ; default is 20
  (recentf-max-menu-items 15)
  (history-length 300)
  (history-delete-duplicates t)
  (create-lockfiles nil)   ; No backup files
  (make-backup-files nil)  ; No backup files
  (backup-inhibited t)     ; No backup files
  (remote-file-name-inhibit-auto-save t)
  (save-place-file (expand-file-name "saveplace" user-emacs-directory))
  (save-place-limit 600)
  (savehist-autosave-interval 600)
  (savehist-additional-variables
   '(kill-ring                        ; clipboard
     register-alist                   ; macros
     mark-ring global-mark-ring       ; marks
     search-ring regexp-search-ring))
  
  ;; FILE REVERTING
  (auto-revert-interval 3)
  (auto-revert-remote-files nil)
  (auto-revert-use-notify t)
  (auto-revert-avoid-polling nil)
  (auto-revert-verbose t)

  ;; ISPELL
  (ispell-dictionary "en_US")

  ;; KILL AND DELETE
  (kill-do-not-save-duplicates t)
  (delete-by-moving-to-trash t)
  (remote-file-name-inhibit-delete-by-moving-to-trash t)

  ;; SYMLINK MANAGEMENT
  (find-file-visit-truename t)
  (vc-follow-symlinks t)
  
  ;; GREP
  (xref-search-program 'ripgrep)
  (grep-command "rg -nS --no-heading ")
  (grep-find-ignored-directories '(".git" "build"))
  
  :config
  ;; IN-TERMINAL BEHAVIOUR
  (unless (display-graphic-p)
	(progn
	  (xterm-mouse-mode)
	  ;; Changes the vertical separator to a full vertical line
	  ;; and truncation symbol to a right arrow
	  (set-display-table-slot standard-display-table 'truncation ?\u2192)
	  (set-display-table-slot standard-display-table 'vertical-border (make-glyph-code ?│))
	  (setq x-select-enable-clipboard t
			x-select-enable-primary t
			x-select-request-type '(UTF8_STRING COMPOUND_TEXT TEXT STRING)
			x-stretch-cursor t)))
  
  ;; Makes everything accept utf-8 as default, so buffers with tsx and so
  ;; won't ask for encoding (because undecided-unix) every single keystroke
  (modify-coding-system-alist 'file "" 'utf-8)

  ;; Set line-number-mode with relative numbering
  (setq display-line-numbers-type 'relative)
  (add-hook 'prog-mode-hook #'display-line-numbers-mode)

  ;; Add option "d" to whenever using C-x s or C-x C-c, allowing a quick preview
  ;; of the diff of what you're asked to save.
  (add-to-list 'save-some-buffers-action-alist
               (list "d"
					 (lambda (buffer) (diff-buffer-with-file (buffer-file-name buffer)))
					 "show diff between the buffer and its file"))

  ;; Runs 'post-init.el' after Emacs inits
  (add-hook 'after-init-hook
			(lambda ()
              (let ((private-file (expand-file-name "post-init.el" user-emacs-directory)))
				(when (file-exists-p private-file)
                  (load private-file)))))

  ;; Save manual customizations to other file than init.el
  (setq custom-file (locate-user-emacs-file "custom-vars.el"))
  (load custom-file 'noerror 'nomessage)

  :init
  (repeat-mode 1)
  (savehist-mode 1)
  (save-place-mode 1)
  (global-auto-revert-mode t)
  
  (with-current-buffer (get-buffer-create "*scratch*")
    (insert (format
			 ";;   Loading time : %s
;;   Packages     : %s
;;
"
             (emacs-init-time)
             (number-to-string (length package-activated-list))))))

(use-package use-package
  :init
  (setq package-install-upgrade-built-in t)
  (setq package-enable-at-startup nil)
  (setq package-quickstart nil)
  (setq use-package-always-ensure nil)
  (setq use-package-compute-statistics t)
  (setq package-archives '(("melpa" . "https://melpa.org/packages/")
                           ("melpa-stable" . "https://stable.melpa.org/packages/")
                           ("gnu" . "https://elpa.gnu.org/packages/")
                           ("elpa" . "https://elpa.gnu.org/packages/")
                           ("elpa-devel" . "https://elpa.gnu.org/devel/")
                           ("nongnu" . "https://elpa.nongnu.org/nongnu/")))

  (customize-set-variable 'package-archive-priorities '(("elpa" . 100)
														("elpa-devel" . 101)
														("gnu"    . 99)
														("nongnu" . 80)
														("stable" . 70)
														("melpa"  . 0))))

(use-package dired
  :defer t
  :config
  (put 'dired-find-alternate-file 'disabled nil)
  :custom ((dired-listing-switches "-agho --group-directories-first")
		   (dired-dwin-target t)))

(use-package ibuffer
  :hook (ibuffer-mode . (lambda () (ibuffer-switch-to-saved-filter-groups "default")))
  :defer t
  :custom ((ibuffer-saved-filter-groups
			'(("default"
			   ("org" (or
					   (mode . org-mode)
					   (name . "^\\*Org Src")
					   (name . "^\\*Org Agenda\\*$")))
			   ("tramp" (name . "^\\*tramp.*"))
			   ("terminal" (or
							(mode . term-mode)
							(mode . shell-mode)
							(mode . eshell-mode)))
			   ("ediff" (or
						 (name . "^\\*ediff.*")
						 (name . "^\\*Ediff.*")))
			   ("dired" (mode . dired-mode))
			   ("help" (or
						(name . "^\\*Help\\*$")
						(name . "^\\*info\\*$")
						(name . "^\\*helpful")))
			   ("emacs" (or
						 (name . "^\\*scratch\\*$")
						 (name . "^\\*Messages\\*$")
						 (name . "^\\*Warnings\\*$")
						 (name . "^\\*Shell Command Output\\*$")
						 (name . "^\\*Async-native-compile-log\\*$")
						 (name . "^\\*straight-")
			 (name . "^\\*"))))))
		   (ibuffer-show-empty-filter-groups nil)))

(use-package eshell
  :defer t
  :config
  (add-hook 'eshell-mode-hook
			(lambda ()
              (local-set-key (kbd "C-l")
							 (lambda ()
                               (interactive)
                               (eshell/clear 1)
                               (eshell-send-input)))))

  (add-hook 'eshell-mode-hook (lambda () (setenv "TERM" "xterm-256color")))
  (add-to-list 'eshell-modules-list 'eshell-tramp)
  (setq eshell-prefer-lisp-functions t)
  (setq eshell-prefer-lisp-variables t)
  (setq eshell-hist-ignoredups 'erase)
  (setq eshell-visual-commands
		'("vi" "screen" "top"  "htop" "btm" "less" "more" "nvim" "vim")))

(use-package eglot
  :custom
  (eglot-autoshutdown t)
  (eglot-events-buffer-size 0)
  (eglot-events-buffer-config '(:size 0 :format full))
  (eglot-prefer-plaintext t)
  (jsonrpc-event-hook nil)
  (eglot-code-action-indications nil)
  :init
  (fset #'jsonrpc--log-event #'ignore)

  :bind (:map
		 eglot-mode-map
		 ("C-c l a" . eglot-code-actions)
		 ("C-c l o" . eglot-code-actions-organize-imports)
		 ("C-c l r" . eglot-rename)
		 ("C-c l f" . eglot-format)))

(use-package minibuffer
  :custom
  ;; (completion-auto-select t) ;; only turn this on if not using icomplete
  (enable-recursive-minibuffers t)
  (read-file-name-completion-ignore-case t)
  (read-buffer-completion-ignore-case t)
  :config
  ;; Keep the cursor out of the read-only portions of the minibuffer
  (setq minibuffer-prompt-properties
		'(read-only t intangible t cursor-intangible t face minibuffer-prompt))
  (add-hook 'minibuffer-setup-hook #'cursor-intangible-mode)

  ;; Keep minibuffer lines unwrapped, long lines like on M-y will be truncated
  (add-hook 'minibuffer-setup-hook
			(lambda () (setq truncate-lines t)))

  (minibuffer-depth-indicate-mode 1)
  (minibuffer-electric-default-mode 1))

(use-package electric-pair
  :defer
  :hook (after-init . electric-pair-mode))

(use-package whitespace
  :init
  (setq whitespace-style '(face trailing tabs spaces indentation emtpy))
  :config
  (add-hook 'whitespace-mode-hook
  		  (lambda ()
  			(set-face-attribute 'whitespace-indentation nil :foreground 'unspecified :background 'unspecified)
  			(set-face-attribute 'whitespace-line nil :foreground 'unspecified :background 'unspecified)
  			(set-face-attribute 'whitespace-space nil :foreground 'unspecified :background 'unspecified))))

(use-package compilation-mode
  :defer t
  :init (setq compilation-always-kill t
			  compilation-scroll-output 'first-error ))

(use-package org
  :defer t
  :mode ("\\.org\\'" . org-mode)
  :hook (org-mode . (lambda ()
					  (set-fill-column 130)
					  (visual-line-mode 1)))
  :config
  (setq
   ;; Start collapsed for speed
   org-startup-folded t
   org-startup-indented t

   ;; Edit settings
   org-auto-align-tags nil
   org-tags-column 0
   org-catch-invisible-edits 'show-and-error
   org-special-ctrl-a/e t
   org-insert-heading-respect-content t
   org-use-sub-superscripts "{}"
   org-log-done t

   ;; Org styling, hide markup etc.
   org-startup-with-inline-images t
   org-hide-emphasis-markers t
   org-image-actual-width '(450)
   org-pretty-entities t
 ))

(use-package rust-ts-mode
  :ensure rust-ts-mode
  :mode "\\.rs\\'"
  :defer t
  :custom
  (rust-indent-level 2)
  :config
  (add-to-list 'treesit-language-source-alist '(rust "https://github.com/tree-sitter/tree-sitter-rust" "master" "src")))

(provide 'init)
