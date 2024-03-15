;; -*- lexical-binding: t; -*-

;; global variables
(setq lm/conf-dir (file-truename user-emacs-directory))

(setq backup-inhibited t)
(setq auto-save-default nil)
(setq create-lockfiles nil)
(setq custom-file (concat lm/conf-dir "/emacs-custom.el"))

;; GUI attributes
(set-face-attribute 'default nil :font "Cascadia Code" :height 100)
(load-theme 'wombat)
(column-number-mode)
(global-display-line-numbers-mode t)

(dolist (mode '(org-mode-hook
		eshell-mode-hook
		shell-mode-hook))
  (add-hook mode (lambda () (display-line-numbers-mode 0))))

;; package management
(require 'package)
(setq package-archives '(("melpa" . "https://melpa.org/packages/")
			 ("elpa" . "https://elpa.gnu.org/packages/")
			 ("nongnu" . "https://elpa.nongnu.org/nongnu/")))
(setq package-user-dir (concat lm/conf-dir "/elpa/"))
(package-initialize)
(unless package-archive-contents
  (package-refresh-contents))

(require 'use-package)
(setq use-package-always-ensure t)
(setq use-package-compute-statistics t)
(setq use-package-verbose nil)

;; keymaps
(global-set-key (kbd "<escape>") 'keyboard-escape-quit)

(use-package ivy
  :diminish
  :bind (("C-s" . swiper)
	 :map ivy-minibuffer-map
	 ("TAB" . ivy-alt-done)
	 ("C-l" . ivy-alt-done)
	 ("C-j" . ivy-next-line)
	 ("C-k" . ivy-previous-line)
	 :map ivy-switch-buffer-map
	 ("C-k" . ivy-previous-line)
	 ("C-l" . ivy-done)
	 ("C-d" . ivy-switch-buffer-kill)
	 :map ivy-reverse-i-search-map
	 ("C-k" . ivy-previous-line)
	 ("C-d" . ivy-reverse-i-search-kill))
  :config
  (ivy-mode))

(use-package counsel
  :config
  (counsel-mode 1))

(use-package helpful
  :custom
  (counsel-describe-function-function #'helpful-callable)
  (counsel-describe-variable-function #'helpful-variable)
  :bind
  ([remap describe-function] . counsel-descrive-function)
  ([remap describe-command] . helpful-function)
  ([remap describe-variable] . counsel-descrive-variable)
  ([remap describe-key] . helpful-key))
  
(use-package ivy-rich
  :after counsel
  :init
  (ivy-rich-mode 1))

(use-package evil
  :init
  (setq evil-want-integration t)
  (setq evil-want-keybinding nil)
  (setq evil-symbol-word-search t)
  (unless (display-graphic-p) (setq evil-want-C-i-jump nil))
  (setq evil-undo-system 'undo-redo)
  :config
  ;; ----------------------------- LEADER KEYMAPS ------------------------------
  ;; (keymap-set evil-normal-state-map "SPC" lm/leader-map)
  ;; (keymap-set evil-motion-state-map "SPC" lm/leader-map)
  ;; ------------------------- NORMAL STATE KEYMAPS ----------------------------
  (keymap-set evil-normal-state-map "H" 'previous-buffer)
  (keymap-set evil-normal-state-map "L" 'next-buffer)
  (keymap-set evil-normal-state-map "U" 'undo-redo)
  ;; ------------------------- INSERT STATE KEYMAPS ----------------------------
  (keymap-set evil-insert-state-map "C-g" 'evil-normal-state)
  ;; (defvar lm/insert-map (make-sparse-keymap)
  ;;   "Keymap for shortcuts in insert mode")
  ;; (keymap-set evil-insert-state-map "C-c" lm/insert-map)
  ;; ----------------------------- GLOBAL KEYMAPS ------------------------------
  (keymap-set global-map "C-s" 'save-buffer)
  ;; ---------------------------------------------------------------------------
  (evil-mode))

(use-package evil-collection
  :custom (evil-collection-want-unimpaired-p nil)
  :init
  (setq evil-collection-key-blacklist '("SPC"))
  :config
  (evil-collection-init))
