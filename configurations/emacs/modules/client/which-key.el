;; -*- lexical-binding: t; -*-

;;-----------------------------------------------------------------------------
;;; which-key
;;-----------------------------------------------------------------------------

(use-package which-key
  :diminish
  :defer 1
  :config
  (which-key-mode)
  (setq which-key-idle-delay 0.1)
  (which-key-setup-minibuffer))
