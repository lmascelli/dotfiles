(use-package corfu
  :ensure t
  :init
  (global-corfu-mode)
  :custom
  (corfu-auto t)
  (corfu-auto-delay 0.3)
  (corfu-preview-current nil)
  (corfu-quit-no-match 'separator)
  )

(unless (display-graphic-p)
  (use-package corfu-terminal
    :init
    (custom-set-faces
     '(corfu-default ((t (:background "black")))))
    :config
    (corfu-terminal-mode)))

(provide 'lm-corfu)
