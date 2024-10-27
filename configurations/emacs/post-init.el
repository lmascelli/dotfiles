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

(use-package terminal-here 
  :config
  (if (executable-find "wezterm")
      (progn
        (add-to-list 'terminal-here-terminal-command-table
                     '(wezterm . (lambda (dir) '("wezterm"))))
        (setq terminal-here-terminal-command 'wezterm))))

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
