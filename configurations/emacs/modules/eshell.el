;; -*- lexical-binding: t -*-

(let (nested)
  (defun lm/switch-icomplete-when-in-eshell-mode))

(use-package eshell
  :defer t
  :config
  (add-hook 'buffer-list-update-hook
	    (lambda ()
	      (progn ))))
