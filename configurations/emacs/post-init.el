;; -*- lexical-binding: t -*-

(fido-vertical-mode)
(use-package lm-utils)
(use-package lm-enhanced-eshell :after eshell)
(use-package lm-terminal-here)

(unless (display-graphic-p)
  (use-package xclip
	:ensure t
	:config
	(xclip-mode)))


(require 'lm-company)
(require 'lm-lsp-mode)
(require 'lm-ultra-scroll)

;; (set-frame-size nil 80 40)
(menu-bar-mode 1)

(setq default-directory "C:/Users/leona/")
