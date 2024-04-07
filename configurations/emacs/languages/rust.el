(if lm/with-lsp
    (use-package rustic
      :mode ("*.rs" . rustic-mode)
      :defer nil)
  (use-package rust-mode
    :mode ("*.rs" . rust-mode)
    :defer t)
  )

(use-package eglot
  :config
  (add-to-list 'eglot-server-programs
	       '((rust-ts-mode rust-mode) .
		 ("rust-analyzer"
		  :initializationOptions (:check
					  (:command "clippy"))))))
