;;-----------------------------------------------------------------------------
;;; global variables
;;-----------------------------------------------------------------------------
;; configuration path
(setq lm/conf-dir (file-truename user-emacs-directory))
(setq lm/dot-dir (file-name-directory (directory-file-name lm/conf-dir)))
(setq lm/sound-dir (concat lm/dot-dir "sounds/"))

;;-----------------------------------------------------------------------------
;;; loading modules 
;;-----------------------------------------------------------------------------

(let ((modules
       '("settings"
	 "packages"
	 "tree-sitter"
	 "dired"
	 "grep"
	 "which-key"
	 "evil"
	 "eglot"
	 "corfu"
;;	 "lsp-mode"
;;	 "completion"
	 )))
  (dolist (module modules)
    (let ((file (concat lm/conf-dir "/modules/" module ".el")))
			     (if (file-exists-p file) (load-file file)))))

;;-----------------------------------------------------------------------------
;;; configure languages 
;;-----------------------------------------------------------------------------

(let ((languages
       '("elisp"
	 "rust"
	 "cmake"
	 "powershell"
	 )))
  (dolist (language languages)
    (let ((file (concat lm/conf-dir "/languages/" language ".el")))
			     (if (file-exists-p file) (load-file file)))))

;;-----------------------------------------------------------------------------
;;; customizations file 
;;-----------------------------------------------------------------------------
(if (file-exists-p custom-file) (load-file custom-file))
