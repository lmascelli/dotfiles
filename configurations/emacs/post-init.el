(require 'lm-rust)

(use-package olivetti
  :ensure t)

(use-package zig-mode
  :mode "\\.zig\\'"
  :config
  (setq zig-format-on-save nil))
