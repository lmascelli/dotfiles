;; -*- lexical-binding: t; -*-
(defun lm/open-configuration ()
  (interactive)
  (find-file (expand-file-name "init.el" user-emacs-directory)))

(defun lm/complete ()
  (interactive)
  (funcall lm/completef))
