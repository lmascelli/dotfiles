(use-package modus-themes
  :demand t
  :custom
  (modus-themes-italic-constructs t)
  (modus-themes-bold-constructs t)
  :config
  (setq lm-action-toggle-theme-ptr #'(lambda (&rest r) (modus-themes-toggle))))

(provide 'lm-modus-themes)
