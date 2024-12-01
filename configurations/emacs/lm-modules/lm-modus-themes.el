(use-package modus-themes
  :demand t
  :custom
  (modus-themes-italic-constructs t)
  (modus-themes-bold-constructs t)
  :init (add-hook 'modus-themes-after-load-theme-hook #'(lambda () (setq lm-action-toggle-theme-ptr 'modus-themes-toogle))))

(provide 'lm-modus-themes)
