(if (boundp 'start-process)
    ;; server process case
    (progn
      (use-package eglot
	:init
	(setq eglot-connect-timeout 90)

	:config
	;; ----------------------------- LSP KEYMAPS -------------------------------
	(defvar lm/leader-map-lsp (make-sparse-keymap)
	  "sub-keymap for lsp operations")
	(keymap-set lm/leader-map "l" `("+lsp" . ,lm/leader-map-lsp))
	(keymap-set lm/leader-map-lsp "f" 'eglot-format-buffer)
	(keymap-set lm/leader-map-lsp "a" 'eglot-code-actions)
	(keymap-set lm/leader-map-lsp "r" 'eglot-rename)
	(defvar lm/leader-map-lsp-go-to (make-sparse-keymap)
	  "sub-keymap for lsp go to operations")
	(keymap-set lm/leader-map-lsp "g" `("+Go to" . ,lm/leader-map-lsp-go-to))
	(keymap-set lm/leader-map-lsp-go-to "d" 'xref-find-definition)
	(keymap-set lm/leader-map-lsp-go-to "r" 'xref-find-references)
	(defvar lm/leader-map-lsp-diagnostics (make-sparse-keymap)
	  "sub-keymap for lsp diagnostics operations")
	(keymap-set lm/leader-map-lsp "d" `("+Diagnostics" . ,lm/leader-map-lsp-diagnostics))
	(keymap-set lm/leader-map-lsp-diagnostics "l" 'flymake-show-project-diagnostics)
	(keymap-set lm/leader-map-lsp-diagnostics "n" 'flymake-goto-next-error)
	(keymap-set lm/leader-map-lsp-diagnostics "p" 'flymake-goto-prev-error)))

  (progn
    (use-package eglot
      :defer t
      :init
      (setq eglot-connect-timeout 90)

      :config
      ;; ----------------------------- LSP KEYMAPS -------------------------------
      (defvar lm/leader-map-lsp (make-sparse-keymap)
	"sub-keymap for lsp operations")
      (keymap-set lm/leader-map "l" `("+lsp" . ,lm/leader-map-lsp))
      (keymap-set lm/leader-map-lsp "f" 'eglot-format-buffer)
      (keymap-set lm/leader-map-lsp "a" 'eglot-code-actions)
      (keymap-set lm/leader-map-lsp "r" 'eglot-rename)
      (defvar lm/leader-map-lsp-go-to (make-sparse-keymap)
	"sub-keymap for lsp go to operations")
      (keymap-set lm/leader-map-lsp "g" `("+Go to" . ,lm/leader-map-lsp-go-to))
      (keymap-set lm/leader-map-lsp-go-to "d" 'xref-find-definition)
      (keymap-set lm/leader-map-lsp-go-to "r" 'xref-find-references)
      (defvar lm/leader-map-lsp-diagnostics (make-sparse-keymap)
	"sub-keymap for lsp diagnostics operations")
      (keymap-set lm/leader-map-lsp "d" `("+Diagnostics" . ,lm/leader-map-lsp-diagnostics))
      (keymap-set lm/leader-map-lsp-diagnostics "l" 'flymake-show-project-diagnostics)
      (keymap-set lm/leader-map-lsp-diagnostics "n" 'flymake-goto-next-error)
      (keymap-set lm/leader-map-lsp-diagnostics "p" 'flymake-goto-prev-error))))
