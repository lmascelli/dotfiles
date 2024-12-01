(cond
 ((eq lm-in-buffer-completion 'company)
  (require 'lm-company))

 ((eq lm-in-buffer-completion 'corfu)
  (require 'lm-corfu))

 ((eq lm-in-buffer-completion 'builtin)
  (progn
    (setq lm-action-complete #'completion-at-point)
     ;; TODO hints dabbrev-complete (f), completion-at-point-functions (v)
     ;; check the customize page for capf
 )))

(provide 'lm-completion)
