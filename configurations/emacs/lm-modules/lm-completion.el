(cond
 ((eq lm-in-buffer-completion 'company)
  (require 'lm-company))

 ((eq lm-in-buffer-completion 'builtin)
  (progn
    (defun lm-action-complete ()
      (interactive)
      (completion-at-point))))
 )

(provide 'lm-completion)
