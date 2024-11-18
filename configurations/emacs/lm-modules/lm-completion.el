(cond
 ((eq lm-in-buffer-completion 'company)
  (require 'lm-company))

 ((eq lm-in-buffer-completion 'corfu)
  (require 'lm-corfu))

 ((eq lm-in-buffer-completion 'builtin)
  (progn
    (setq
     ;; TODO hints dabbrev-complete (f), completion-at-point-functions (v)
     ;; check the customize page for capf
     )
    (defun lm-action-complete ()
      (interactive)
      (completion-at-point))))
 )

(provide 'lm-completion)
