(require 'lm-rust)

(use-package olivetti
  :ensure t)

(use-package zig-mode
  :mode "\\.zig\\'"
  :config
  (setq zig-format-on-save nil))

(add-hook 'rust-ts-mode-hook 'eglot-ensure)
(add-hook 'python-mode-hook 'eglot-ensure)
