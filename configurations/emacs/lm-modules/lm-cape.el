(use-package cape
  :ensure t
  :defer nil
  :bind (("C-<SPC>" . 'completion-at-point))
  :init
  (setq completion-ignore-case t)
  (add-to-list 'completion-at-point-functions 'cape-dabbrev)
  (add-to-list 'completion-at-point-functions 'cape-file)) 

(provide 'lm-cape)
