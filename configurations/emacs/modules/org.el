;; -*- lexical-binding: t -*-

(use-package org
  :init
  (if (daemonp)
      (progn (org-mode)
	     (emacs-lisp-mode)))
  :config
  (org-babel-do-load-languages
   'org-babel-load-languages
   '((emacs-lisp . t)
     (python     . t))))
