(defun lm-eglot-mode-keymaps ()
  (cond ((eq lm-input-mode 'evil)
         (progn
           (keymap-set evil-normal-state-map "C-w C-d" #'flymake-show-buffer-diagnostics)
           ))))

(use-package eglot
  :ensure t
  :defer t
  :pin elpa-devel
  :config
  (add-hook eglot-managed-mode-hook #'lm-eglot-mode-keymaps)
  :init
  (setq eglot-events-buffer-config 0)
  (setq eglot-connect-timeout 90))


(provide 'lm-eglot)
