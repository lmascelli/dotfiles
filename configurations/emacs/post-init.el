(require 'lm-rust)

(use-package olivetti
  :ensure t)

(use-package zig-mode
  :mode "\\.zig\\'"
  :config
  (setq zig-format-on-save nil))

(add-hook 'rust-mode-hook 'lsp-deferred)
(add-hook 'python-mode-hook 'lsp-deferred)
