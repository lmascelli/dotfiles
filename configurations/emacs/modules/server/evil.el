;; -*- lexical-binding: t; -*-

;;-----------------------------------------------------------------------------
;;; evil mode
;;-----------------------------------------------------------------------------
(use-package evil
  :init
  (setq lm/evil-mode t)
  (setq evil-want-integration t)
  (setq evil-want-keybinding nil)
  (setq evil-symbol-word-search t)
  (unless (display-graphic-p) (setq evil-want-C-i-jump nil))
  (setq evil-undo-system 'undo-redo)

  :config
  ;; ----------------------------- LEADER KEYMAPS ------------------------------
  (keymap-set evil-normal-state-map "SPC" lm/leader-map)
  (keymap-set evil-motion-state-map "SPC" lm/leader-map)
  ;; ------------------------- NORMAL STATE KEYMAPS ----------------------------
  (keymap-set evil-normal-state-map "H" 'previous-buffer)
  (keymap-set evil-normal-state-map "L" 'next-buffer)
  (keymap-set evil-normal-state-map "U" 'undo-redo)
  ;; ------------------------- INSERT STATE KEYMAPS ----------------------------
  (keymap-set evil-insert-state-map "C-g" 'evil-normal-state)
  (defvar lm/insert-map (make-sparse-keymap)
    "Keymap for shortcuts in insert mode")
  (keymap-set evil-insert-state-map "C-c" lm/insert-map)
  ;; ----------------------------- GLOBAL KEYMAPS ------------------------------
  (keymap-set global-map "C-s" 'save-buffer)
  ;; ---------------------------------------------------------------------------
  (evil-mode))

(use-package evil-collection
  :after evil
  :custom (evil-collection-want-unimpaired-p nil)
  :init
  (setq evil-collection-key-blacklist '("SPC"))
  :config
  (evil-collection-init))
