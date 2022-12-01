
;; update dired and other buffer when edited outside emacs
(setq global-auto-revert-non-file-buffer t)
(global-auto-revert-mode 1)

;; use spaces instead of tabs
(setq-default indent-tabs-mode nil)

(provide 'ml-defaults)
