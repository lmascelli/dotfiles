;; -*- lexical-binding: t -*-

(use-package olivetti
  :defer t
  :ensure t)

(fido-vertical-mode)
;; (global-hl-line-mode 1)
(use-package lm-utils)
(use-package lm-enhanced-eshell :after eshell)
(use-package lm-terminal-here)

(unless (display-graphic-p)
  (use-package xclip
	:ensure t
	:config
	(xclip-mode)))


(require 'lm-cape)
(global-completion-preview-mode -1)
(require 'lm-company)
(require 'lm-lsp-mode)

(use-package ultra-scroll :ensure t :config (ultra-scroll-mode 1))

(set-frame-size nil 80 40)
(menu-bar-mode 1)
