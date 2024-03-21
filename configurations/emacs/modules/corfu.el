;; -*- lexical-binding: t; -*-

(use-package corfu
  :defer 1
  :init
  (setq corfu-auto t
	corfu-auto-delay 0.3
	corfu-preview-current nil
	corfu-quit-no-match 'separator
	completion-styles '(basic ))
  :config
  (global-corfu-mode))

(use-package cape
  :after corfu
  :init
  (add-hook 'prog-mode-hook
	    (lambda
	      ()
	      (add-to-list 'completion-at-point-functions #'cape-dabbrev)
	      (add-to-list 'completion-at-point-functions #'cape-file))))

;; Use Dabbrev with Corfu!
(use-package dabbrev
  ;; Swap M-/ and C-M-/
  :bind (("M-/" . dabbrev-completion)
         ("C-M-/" . dabbrev-expand))
  :config
  (add-to-list 'dabbrev-ignored-buffer-regexps "\\` ")
  ;; Since 29.1, use `dabbrev-ignored-buffer-regexps' on older.
  (add-to-list 'dabbrev-ignored-buffer-modes 'doc-view-mode)
  (add-to-list 'dabbrev-ignored-buffer-modes 'pdf-view-mode))

(use-package orderless
  :after corfu
  :init
  (setq completion-styles '(orderless basic)
	completion-category-defaults nil
	completion-category-overrides '((file (styles partial-completion)))))

