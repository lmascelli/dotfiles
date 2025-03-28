(use-package emacs
  :bind
  (("C-z" . nil)
   ("C-x C-z" . nil))
  :custom
  ;; EDITING
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
  (tab-bar-close-button-show nil)
  (tab-bar-new-button-show nil)
  (tab-bar-tab-hints t)
  
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
  
  ;; MINIBUFFER
  (enable-recursive minibuffers t)
  
  ;; FRAME BEHAVIOUR
  (frame-resize-pixelwise t)
  
  ;; WINDOW BEHAVIUOR
  (window-resize-pixelwise nil)    
  (help-window-select t)
  (split-width-threshold 170)     ; So vertical splits are preferred
  (split-height-threshold nil)
  
  ;; STARTUP
  (inhibit-startup-message t)
  (initial-scratch-message "")

  ;; HISTORY AND BACKUP FILES
  (recentf-max-saved-items 300) ; default is 20
  (recentf-max-menu-items 15)
  (history-length 300)
  (create-lockfiles nil)   ; No backup files
  (make-backup-files nil)  ; No backup files
  (backup-inhibited t)     ; No backup files
  (remote-file-name-inhibit-auto-save t)
  (save-place-file (expand-file-name "saveplace" user-emacs-directory))
  (save-place-limit 600)
  
  ;; ISPELL
  (ispell-dictionary "en_US")

  ;; KILL AND DELETE
  (kill-do-not-save-duplicates t)
  (delete-by-moving-to-trash t)
  (remote-file-name-inhibit-delete-by-moving-to-trash t)

  ;; GREP
  (xref-search-program 'ripgrep)
  (grep-command "rg -nS --no-heading ")
  (grep-find-ignored-directories '(".git" "build"))
  
  :config
  ;; Makes everything accept utf-8 as default, so buffers with tsx and so
  ;; won't ask for encoding (because undecided-unix) every single keystroke
  (modify-coding-system-alist 'file "" 'utf-8)

  ;; Save manual customizations to other file than init.el
  (setq custom-file (locate-user-emacs-file "custom-vars.el"))
  (load custom-file 'noerror 'nomessage)
  
  ;; Set line-number-mode with relative numbering
  (setq display-line-numbers-type 'relative)
  (add-hook 'prog-mode-hook #'display-line-numbers-mode)

  ;; Add option "d" to whenever using C-x s or C-x C-c, allowing a quick preview
  ;; of the diff of what you're asked to save.
  (add-to-list 'save-some-buffers-action-alist
               (list "d"
					 (lambda (buffer) (diff-buffer-with-file (buffer-file-name buffer)))
					 "show diff between the buffer and its file"))

  ;; On Terminal: changes the vertical separator to a full vertical line
  ;;              and truncation symbol to a right arrow
  (set-display-table-slot standard-display-table 'vertical-border ?\u2502)
  (set-display-table-slot standard-display-table 'truncation ?\u2192)

  ;; Runs 'post-init.el' after Emacs inits
  (add-hook 'after-init-hook
			(lambda ()
              (let ((private-file (expand-file-name "post-init.el" user-emacs-directory)))
				(when (file-exists-p private-file)
                  (load private-file)))))

  :init
  (global-auto-revert-mode 1)
  (recentf-mode 1)
  (repeat-mode 1)
  (savehist-mode 1)
  (save-place-mode 1)
  (xterm-mouse-mode 1)
  
  (with-current-buffer (get-buffer-create "*scratch*")
    (insert (format
			 ";;   Loading time : %s
;;   Packages     : %s
;;
"
             (emacs-init-time)
             (number-to-string (length package-activated-list)))))

  (message (emacs-init-time)))

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
  :custom
  (dired-dwin-target t))

(use-package eshell
:ensure nil
:defer t
:config

(defun eshell/cat-with-syntax-highlighting (filename)
  "Like cat(1) but with syntax highlighting.
Stole from aweshell"
  (let ((existing-buffer (get-file-buffer filename))
        (buffer (find-file-noselect filename)))
    (eshell-print
     (with-current-buffer buffer
       (if (fboundp 'font-lock-ensure)
           (font-lock-ensure)
         (with-no-warnings
           (font-lock-fontify-buffer)))
       (let ((contents (buffer-string)))
         (remove-text-properties 0 (length contents) '(read-only nil) contents)
         contents)))
    (unless existing-buffer
      (kill-buffer buffer))
    nil))
(advice-add 'eshell/cat :override #'eshell/cat-with-syntax-highlighting)

(add-hook 'eshell-mode-hook
          (lambda ()
            (local-set-key (kbd "C-c l") #'emacs-solo/eshell-pick-history)
            (local-set-key (kbd "C-l")
                           (lambda ()
                             (interactive)
                             (eshell/clear 1)
                             (eshell-send-input)))))

(add-hook 'eshell-mode-hook (lambda () (setenv "TERM" "xterm-256color")))

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
  :ensure nil
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

(use-package elec-pair
  :ensure nil
  :defer
  :hook (after-init . electric-pair-mode))

(use-package org
  :ensure nil
  :defer t
  :mode ("\\.org\\'" . org-mode)
  :config
  (setq
   ;; Start collapsed for speed
   org-startup-folded t

   ;; Edit settings
   org-auto-align-tags nil
   org-tags-column 0
   org-catch-invisible-edits 'show-and-error
   org-special-ctrl-a/e t
   org-insert-heading-respect-content t

   ;; Org styling, hide markup etc.
   org-hide-emphasis-markers t
   org-pretty-entities t))

(use-package rust-ts-mode
  :ensure rust-ts-mode
  :mode "\\.rs\\'"
  :defer t
  :custom
  (rust-indent-level 2)
  :config
  (add-to-list 'treesit-language-source-alist '(rust "https://github.com/tree-sitter/tree-sitter-rust" "master" "src")))

(use-package cape
    :ensure t
    :defer nil
    :init
    (setq completion-ignore-case t)
    (add-to-list 'completion-at-point-functions 'cape-dabbrev)
    (add-to-list 'completion-at-point-functions 'cape-keyword)
    (add-to-list 'completion-at-point-functions 'cape-file))

(provide 'init)
