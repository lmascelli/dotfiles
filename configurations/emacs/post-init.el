;; -*- lexical-binding: t -*-

(use-package olivetti
  :defer t
  :ensure t)

;; (add-hook 'rust-ts-mode-hook 'eglot-ensure)
;; (add-hook 'python-mode-hook 'eglot-ensure)

(fido-vertical-mode)
(global-hl-line-mode 1)
(use-package lm-utils)
(use-package lm-enhanced-eshell
  :after eshell)
(use-package lm-terminal-here)

(unless (display-graphic-p)
  (use-package xclip
	:ensure t
	:config
	(xclip-mode)))

(setq lm-in-buffer-completion 'company)
(global-completion-preview-mode -1)
(require 'lm-company)
(setq lm-lsp-client 'lsp-mode)
(require 'lm-lsp-mode)
