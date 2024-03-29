;; -*- lexical-binding: t; -*-
(if (boundp 'start-process)
    ;; server process case
    (progn
      (use-package corfu
	:init
	(setq corfu-auto t
	      corfu-auto-delay 0.3
	      corfu-preview-current nil
	      corfu-quit-no-match 'separator
	      completion-styles '(basic ))
	(global-corfu-mode))
      (use-package orderless
	:init
	(setq completion-styles '(orderless basic)
        completion-category-defaults nil
        completion-category-overrides '((file (styles partial-completion))))))
  (progn
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
      (use-package orderless
	:after corfu
	:init
	(setq completion-styles '(orderless basic)
        completion-category-defaults nil
        completion-category-overrides '((file (styles partial-completion)))))))
