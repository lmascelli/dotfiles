;;-----------------------------------------------------------------------------
;;; elisp
;;-----------------------------------------------------------------------------
;; imenu for elisp outline of sections
(add-hook 'emacs-lisp-mode-hook
	  (lambda ()
	    (add-to-list 'imenu-generic-expression
			 '("Sections" "\\s-*;;;\\(.*\\)$" 0))))
