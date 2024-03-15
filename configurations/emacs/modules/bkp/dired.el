;------------------------------------------------------------------------------
;;; dired
;------------------------------------------------------------------------------

(use-package dired
  :hook (dired-mode . dired-hide-details-mode)
  :ensure nil
  :custom ((dired-listing-switches "-agho --group-directories-first"))
  :config
  (put 'dired-find-alternate-file 'disabled nil)
  (setq dired-dwim-target t))
