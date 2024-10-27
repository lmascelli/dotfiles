(if (eq lm-in-buffer-completion 'company)
    (use-package company
      :ensure t
      :diminish
      :defer 1
      :init
      (defun lm/complete ()
        (interactive)
        (company-complete))
      (setq company-dabbrev-ignore-case t)
      (setq company-dabbrev-code-ignore-case t)    
      (setq company-keywords-ignore-case t)
      (setq company-minimum-prefix-length 1)
      (setq company-idle-delay 0.3)
      :config
      ;; (add-to-list 'company-backends '(company-capf :with company-dabbrev))
      (defun lm/company-format-margin (candidate selected)
        "Format the margin with the backend name."
        (let ((backend (company-call-backend 'annotation candidate)))
          (if backend
              (format " [%s]" backend)
            "")))
      (setq company-format-margin-function 'lm/company-format-margin)

      (global-company-mode t)))

(use-package eat
  :ensure t
  :config
  (defun eat-default-shell () "pwsh")
  (setq eat-default-shell-function '(lambda () "pwsh"))
  )

(use-package terminal-here 
  :config
  (if (executable-find "wezterm")
      (progn
        (add-to-list 'terminal-here-terminal-command-table
                     '(wezterm . (lambda (dir) '("wezterm"))))
        (setq terminal-here-terminal-command 'wezterm))))

(use-package doom-themes
  :config
  (setq modus-themes-headings
        '((1 . (variable-pitch light 1.4))))
  )

(use-package nerd-icons)
(use-package doom-modeline
  :init (doom-modeline-mode 1)
  :custom ((doom-modeline-height 25)))

(if (eq lm-lsp-client 'eglot)
    (use-package eglot
      :ensure t
      :defer t
      :pin elpa-devel
      :init
      (setq eglot-events-buffer-config 0)
      (setq eglot-connect-timeout 90)
      ;; :config
      ;; (lm/leader-keys
      ;;  :keymaps 'override
      ;;  :states 'normal
      ;;  "lf" '(eglot-format-buffer :which-key "format buffer")
      ;;  "ls" '(eglot-shutdown-all :which-key "shutdown workspace")
      ;;  "lg" '(:ignore t :which-key "go to")
      ;;  "lgd" '(xref-find-definitions :which-key "definition")
      ;;  "lgr" '(xref-find-references :which-key "references")
      ;;  "ld" '(:ignore t :which-key "diagnostics")
      ;;  "ldl" '(flymake-show-project-diagnostics :which-key "project")
      ;;  "ldn" '(flymake-goto-next-error :which-key "next")
      ;;  "ldp" '(flymake-goto-prev-error :which-key "previous")
      ;;  "lc" '(:ignore t :which-key "code actions")
      ;;  "lcr" '(eglot-rename :which-key "rename")
      ;;  "lco" '(eglot-code-action-organize-imports :which-key "organize imports")
      ;;  "lco" '(eglot-code-actions :which-key "actions")
      ;;  "lh" '(eldoc :which-key "documentation"))
      ))

(if (eq lm-lsp-client 'lsp-mode)
    (progn
      (defun lm/lsp-mode-setup ()
        (setq lsp-headerline-breadcrumb-segments '(path-up-to-project file symbols))
        (lsp-headerline-breadcrumb-mode))

      (setenv "LSP_USE_PLISTS" "true")
      (setq lsp-use-plists t)
      (use-package lsp-mode
        :ensure t
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
        (keymap-set lm/leader-map-lsp-diagnostics "p" 'flymake-goto-prev-error)

        ;; -------------------------- LSP REMOTE CONNECTIONS -----------------------
                                        ; (lsp-register-client
                                        ;  (make-lsp-client :new-connection (lsp-tramp-connection "clangd")
                                        ;                   :major-modes '(c-mode c++-mode)
                                        ;                   :remote? t
                                        ;                   :server-id 'clangd-remote))
        )

      (use-package lsp-ui
        :ensure t
        :after lsp-mode
        :hook (lsp-mode . lsp-ui-mode)
        :custom
        (lsp-ui-doc-position 'bottom))))

(use-package cmake-mode
  :ensure t
  :mode ("\\CMakeLists.txt" . cmake-mode))

(add-to-list 'auto-mode-alist '("\\.ino\\'" .
                                (lambda ()
                                  (c-or-c++-mode)
                                  (setq lsp-clients-clangd-args
                                        `(
                                          "-j=2"
                                          "--background-index"
                                          "--clang-tidy"
                                          "--completion-style=detailed"
                                          (concat "--query-driver=" (getenv-internal "HOME") "/.platformio/packages/toolchain-atmelavr/bin/avr-g++"))))))

(add-to-list 'auto-mode-alist '("\\.rs\\'" . rust-ts-mode))
