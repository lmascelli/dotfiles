;; -*- lexical-binding: t -*-

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

;; Add the folder of my cust lisp files and modules to the load-path
(mapc (lambda (string)
        (add-to-list 'load-path (concat user-emacs-directory string)))
      '("lm-lisp" "lm-modules" "lm-languages"))

(provide 'early-init)
