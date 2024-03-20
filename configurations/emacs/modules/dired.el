;; -*- lexical-binding: t -*-

(use-package dired
  :ensure nil
  :hook (dired-mode . dired-hide-details-mode)
  :custom ((dired-listing-switches "-agho --group-directories-first"))
  :config
  (put 'dired-find-alternate-file 'disabled nil)
  (setq dired-dwim-target t))
