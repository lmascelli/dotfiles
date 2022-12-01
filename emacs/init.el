(setq lm/dotfiles "d:/.dotfiles")

(scroll-bar-mode -1)
(tool-bar-mode -1)
(tooltip-mode -1)
(menu-bar-mode -1)
(setq visible-bell t)

(defvar lm/default-font-size 100)
(set-face-attribute 'default nil :font "FiraCode NF" :height lm/default-font-size) 
(global-hl-line-mode)
(set-face-attribute 'hl-line nil :inherit nil :background "gray10")

(pixel-scroll-precision-mode)
(setq fast-but-imprecise-scrolling t
			;;       ;;	scroll-conservatively 10000
			auto-window-vscroll nil
			)
;; (setq					
;;  ;; mouse-wheel-scroll-amount '(1 ((shift) . 1) ((control) . nil))
;;  mouse-wheel-progressive-speed nil)

(setq redisplay-dont-pause t)

(set-frame-parameter (selected-frame) 'alpha '(100 . 50))
(setq default-frame-alist '((width . 90) (height . 40) (alpha . (100 . 5))))
(load-theme 'wombat)

(setq inhibit-startup-message t)                              ;; no startup screen
(setq backup-inhibited t)                                     ;; no backup files
(setq message-kill-buffer-query nil)                          ;; no prompt kill buffer
(column-number-mode)                                          ;; column number
(global-display-line-numbers-mode t)                          ;; line number
(dolist (mode '(org-mode-hook
		term-mode-hook
		shell-mode-hook
		eshell-mode-hook))
	(add-hook mode (lambda () (display-line-numbers-mode 0))))
(setq tab-width 2)                                            ;; tab width 2
(add-hook 'prog-mode-hook 'electric-pair-mode)

(setq explicit-shell-file-name "pwsh")
(setq excplicit-powershell.exe-args '("-Command" "-"))

(require 'package)

(setq package-archives '(("melpa" . "https://melpa.org/packages/")
			 ("elpa" . "https://elpa.gnu.org/packages/")))
(package-initialize)
(unless package-archive-contents
  (package-refresh-contents))

(unless (package-installed-p 'use-package)
  (package-install 'use-package))

(require 'use-package)
(setq use-package-always-ensure t)
(use-package diminish)

(use-package ivy
	  :diminish
	  :config
	  (ivy-mode 1))
(use-package ivy-rich
	  :diminish
	  :config
	  (setq ivy-use-virtual-buffers t)
	  (setq enable-recursive-minibuffers t)
	  (ivy-rich-mode 1))
(use-package swiper)
(use-package counsel)

(use-package which-key
  :init (which-key-mode)
  :diminish which-key-mode
  :config (setq which-key-idle-delay 0.3))

(defun lm/lsp-mode-setup ()
  (setq lsp-headerline-breadcrumb-segments '(path-up-to-project file symbols))
  (lsp-headerline-breadcrumb-mode))

(use-package lsp-mode
  :commands (lsp lsp-deferred)
  :hook (lsp-mode . lm/lsp-mode-setup)
  :init
  (setq lsp-keymap-prefix "C-l")
  :config
  (lsp-enable-which-key-integration t))

(use-package lsp-ui
  :hook (lsp-mode . lsp-ui-mode)
  :custom
  (lsp-ui-doc-position 'bottom))

(use-package company
	:bind (("C-." . company-complete)))

(use-package powershell)

(add-to-list 'auto-mode-alist '("\\.ino" .
				(lambda ()
				  (c-or-c++-mode)
				  (setq lsp-clients-clangd-args `(
								  "-j=2"
								  "--background-index"
								  "--clang-tidy"
								  "--completion-style=detailed"
								  (concat "--query-driver=" (getenv-internal "HOME") "/.platformio/packages/toolchain-atmelavr/bin/avr-g++"))))))

(global-set-key (kbd "<escape>") 'keyboard-escape-quit)
(global-set-key (kbd "<f2>") 'counsel-M-x)
(global-set-key (kbd "C-z") 'undo)
;; (global-set-key (kbd "C-.") 'dabbrev-expand)

(windmove-default-keybindings 'meta)

(use-package general
  :config
  (general-create-definer lm/leader-keys
    :keymaps 'override
    :prefix "<f3>"))

(lm/leader-keys
 "RET" '(counsel-M-x :which-key "M-x"))

(lm/leader-keys
  "SPC" '(set-mark-command :which-key "toggle mark"))

(lm/leader-keys
"t" '(:ignored t :which-key "tab")
"tn" '(tab-new :which-key "new")
"tj" '(tab-next :which-key "next")
"tk" '(tab-previous :which-key "previous")
"td" '(tab-close :which-key "close")
"TAB" '(tab-next :which-key "next tab")
"<backtab>" '(tab-previous :which-key "previous tab"))

(lm/leader-keys
	"b"  '(:ignore t :which-key "buffer")
	"bf" '(counsel-find-file :which-key "find file")
	"bs" '(save-buffer :which-key "save buffer")
	"bd" '(kill-buffer :which-key "kill buffer")
	"bl" '(ivy-switch-buffer :which-key "switch buffer")
	"bL" '(list-buffers :which-key "list buffers"))

(lm/leader-keys
	"s" '(:ignore t :which-key "search")
	"ss" '(swiper-isearch :which-key "search")
  "sr" '(replace-string :which-key "replace"))

(lm/leader-keys
	"a"  '(:ignore t :which-key "appearence")
	"a+" '(text-scale-increase :which-key "increase scale")
	"a-" '(text-scale-decrease :which-key "decrease scale")
	"at" '(counsel-load-theme :which-key "choose theme"))

(defun load-init () (interactive)
  (load-file "~/.config/emacs/init.el"))
(lm/leader-keys
  "v" '(:ignored t :which-key "eval")
  "vb" '(eval-buffer :which-key "eval buffer")
  "vl" '(eval-last-sexp :which-key "eval last sexp")
  "vi" '(load-init :which-key "load init.el"))

(lm/leader-keys
  "w" '(:ignored t :which-key "window")
  "wo" '(delete-other-windows :which-key "delete other windows")
  "wc" '(delete-window :which-key "delete window")
  "ws" '(split-window-below :which-key "split horizontal")
  "wv" '(split-window-right :which-key "split vertical"))

(lm/leader-keys
  "T" '(:ignored t :which-key "terminal")
  "Tv" '(term :which-key "term")
  "Ts" '(eshell :which-key "eshell"))

(lm/leader-keys
      "e" '(:ignored t :which-key "explore")
      "ed" '(dired :which-key "dired")
"ec" '(pwd :which-key "pwd"))

(defun lm/lsp-keymap ()
	(interactive)
	(lm/leader-keys
		"l" '(:ignored t :which-key "lsp")
		"lf" '(lsp-format-buffer :which-key "format")))
(add-hook 'lsp-mode-hook 'lm/lsp-keymap)

;; Automatically tangle our init.org config file when we save it
(defun lm/org-babel-tangle-config ()
  (when (string-equal (buffer-file-name)
		      (concat lm/dotfiles "/emacs/init.org"))
    (let ((org-confirm-babel-evaluate nil))
      (org-babel-tangle)
      (load-file (concat user-emacs-directory "init.el")))))
(add-hook 'org-mode-hook (lambda () (add-hook 'after-save-hook #'lm/org-babel-tangle-config)))

;; Move the tangled file to emacs directory
(defun lm/org-tangle-to-init ()
    (interactive)
    (org-babel-tangle)
    (copy-file "./init.el" (concat user-emacs-directory "init.el") t)
    (load-file (concat user-emacs-directory "init.el")))

(require 'org-tempo)
(add-to-list 'org-structure-template-alist '("sh" . "src shell"))
(add-to-list 'org-structure-template-alist '("el" . "src emacs-lisp"))
(add-to-list 'org-structure-template-alist '("py" . "src python"))

(use-package dired
  :ensure nil
  :custom ((dired-listing-switches "-agho --group-directories-first"))
  :config )
