;; -*- lexical-binding: t -*-

(use-package olivetti
  :defer t
  :ensure t)

;; (add-hook 'rust-ts-mode-hook 'eglot-ensure)
;; (add-hook 'python-mode-hook 'eglot-ensure)

(fido-vertical-mode)
(global-hl-line-mode 1)
(use-package lm-utils)
(use-package lm-enhanced-eshell)
(use-package lm-terminal-here
  :after eshell)
