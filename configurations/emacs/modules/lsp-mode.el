(defun lm/lsp-mode-setup ()
  (setq lsp-headerline-breadcrumb-segments '(path-up-to-project file symbols))
  (lsp-headerline-breadcrumb-mode))

(setenv "LSP_USE_PLISTS" "true")
(setq lsp-use-plists t)
(setq lm/with-lsp t)
(use-package lsp-mode
  :commands (lsp lsp-deferred)
  :hook ((c++-mode . lsp-deferred)
	 (c-mode . lsp-deferred)
	 (python-mode . lsp-deferred)
	 (lsp-mode . lsp-enable-which-key-integration)) 
  :config
  (lsp-enable-which-key-integration t)
  (setq lsp-idle-delay 0.100)
  (setq lsp-auto-execute-action nil)
  ;; ----------------------------- LSP KEYMAPS -------------------------------
  (defvar lm/leader-map-lsp (make-sparse-keymap)
    "sub-keymap for lsp operations")
  (keymap-set lm/leader-map "l" `("+lsp" . ,lm/leader-map-lsp))
  (keymap-set lm/leader-map-lsp "f" 'lsp-format-buffer)
  (defvar lm/leader-map-lsp-go-to (make-sparse-keymap)
    "sub-keymap for lsp go to operations")
  (keymap-set lm/leader-map-lsp "g" `("+Go to" . ,lm/leader-map-lsp-go-to))
  (keymap-set lm/leader-map-lsp-go-to "d" 'lsp-find-definition)
  (keymap-set lm/leader-map-lsp-go-to "D" 'lsp-find-declaration)
  (keymap-set lm/leader-map-lsp-go-to "i" 'lsp-find-implementation)
  (keymap-set lm/leader-map-lsp-go-to "r" 'lsp-find-references)
  (defvar lm/leader-map-lsp-diagnostics (make-sparse-keymap)
    "sub-keymap for lsp diagnostics operations")
  (keymap-set lm/leader-map-lsp "d" `("+Diagnostics" . ,lm/leader-map-lsp-diagnostics))
  (keymap-set lm/leader-map-lsp-diagnostics "l" 'flymake-show-project-diagnostics)
  (keymap-set lm/leader-map-lsp-diagnostics "n" 'flymake-goto-next-error)
  (keymap-set lm/leader-map-lsp-diagnostics "p" 'flymake-goto-prev-error))

(use-package lsp-ui
  :after lsp-mode
  :hook (lsp-mode . lsp-ui-mode)
  :custom
  (lsp-ui-doc-position 'bottom))
