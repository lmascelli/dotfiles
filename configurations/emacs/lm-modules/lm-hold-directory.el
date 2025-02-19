(defvar lm-held-directory nil
  "The directory being held has default-directory. If nil no directory is being
hold. This variable is used by the `lm-toggle-hold-cwd' function.")

(defun lm-toggle-hold-cwd ()
  (interactive)
  (setq lm-held-directory (unless lm-held-directory default-directory))
  (dolist (hook
           '(find-file-hook
             window-buffer-change-functions
             dired-mode-hook
             ))
    (add-hook hook #'(lambda () (if lm-held-directory (cd lm-held-directory))))))

(provide 'lm-hold-directory)
