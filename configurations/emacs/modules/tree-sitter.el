;;-----------------------------------------------------------------------------
;;; tree-sitter
;;-----------------------------------------------------------------------------
(use-package tree-sitter
  :defer t
  :init
  (dolist (hook '(c-mode-common-hook))
    (add-hook hook #'tree-sitter-mode)))
(use-package tree-sitter-langs
  :after tree-sitter)
