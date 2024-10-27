(cond
 ((eq lm-lsp-client 'lsp-mode) (require 'lm-lsp-mode))
 (t nil))

(provide 'lm-lsp)
