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
