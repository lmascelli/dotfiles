(if lm/with-lsp
    (use-package rustic
      :mode ("*.rs" . rustic-mode)
      :defer nil)
  (use-package rust-mode
    :mode ("*.rs" . rust-mode)
    :defer t)
  )
