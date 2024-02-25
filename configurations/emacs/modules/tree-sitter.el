;;-----------------------------------------------------------------------------
;;; tree-sitter
;;-----------------------------------------------------------------------------
(use-package tree-sitter
  :defer t
  :init
  (dolist (hook '(c-mode-common-hook
		  rust-mode-hook
		  python-mode-hook))
    (add-hook hook #'tree-sitter-mode)))
(use-package tree-sitter-langs
  :after tree-sitter)
