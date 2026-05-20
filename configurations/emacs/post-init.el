;; -*- lexical-binding: t -*-

(fido-vertical-mode)
(use-package lm-utils)
(use-package lm-enhanced-eshell :after eshell)
(use-package lm-terminal-here)

(require 'lm-ultra-scroll)

; (require 'lm-evil)
(require 'lm-cape)
(require 'lm-company)

(menu-bar-mode 1)
(set-frame-size nil 100 45)

(setq package-check-signature nil)

(setenv "PATH" (concat "/home/leonardo/usr/bin:" (getenv "PATH")))
