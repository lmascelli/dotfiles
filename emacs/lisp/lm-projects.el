;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Author: Leonardo Mascelli
;; Date: 23-05-2023
;; License: MIT
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; This is my management script for handling projects


(setq lm-projects-opened '())

(defun lm-projects-new-project (path) nil)

(defun lm-projects-load-project (path)
  (let ((proj-el (concat path ".project.el")))
    (if (file-exists-p proj-el)
	(progn (load-file proj-el)))))

(defun lm-projects-find-project (path)
  (interactive "DProject path ")
  (let ((proj-el (concat path ".project.el")))
    (if (file-exists-p proj-el)
	(lm-projects-load-project path)
      (let ((rep (read-from-minibuffer
		  ".project.el not found. Create a project here? ")))
	(message (format "%s" rep))))))


(provide 'lm-projects)
