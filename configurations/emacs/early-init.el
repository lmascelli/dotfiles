(setq gc-cons-threshold most-positive-fixnum
      gc-cons-percentage 0.6)

(defun emacs-solo/avoid-initial-flash-of-light ()
  "Avoid flash of light when starting Emacs."
  (setq mode-line-format nil))
(emacs-solo/avoid-initial-flash-of-light)

(setq frame-resize-pixelwise t
      frame-inhibit-implied-resize t
      frame-title-format '("Emacs"))

(setq inhibit-compacting-font-caches t)

(menu-bar-mode -1)
(scroll-bar-mode -1)
(tool-bar-mode -1)
(tooltip-mode -1)

(setq frame-inhibit-implied-resize t
      frame-resize-pixelwise t)

(provide 'early-init)
