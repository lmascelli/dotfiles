;; -*- lexical-binding: t; -*-

;;-----------------------------------------------------------------------------
;;; startup configuration
;;-----------------------------------------------------------------------------

(let ((modules 
       '("custom-functions"	 
	 "settings"
	 "keymaps")))
  (dolist (module modules)
    (let ((file (concat lm/conf-dir "/modules/" module ".el")))
      (if (file-exists-p file) (load-file file)))))

;;-----------------------------------------------------------------------------
;;; lazy loading
;; there can be two way of loading features:
;; 1. all at the start for a server process
;; 2. lazy at request for a standalone cliend
;;-----------------------------------------------------------------------------

(if (boundp 'server-process)
    (progn nil)
  (progn nil))

;;-----------------------------------------------------------------------------
;;; loading modules 
;;-----------------------------------------------------------------------------

(let ((modules
       '("packages"
	 "tree-sitter"
	 "dired"
	 "grep"
	 "which-key"
	 "evil"
	 "eglot"
	 "company"
;;	 "ivy"
;;	 "helm"
;;	 "corfu"
;;	 "lsp-mode"
;;	 "terminal-here"
	 )))
  (dolist (module modules)
    (let ((file (concat lm/conf-dir "/modules/" module ".el")))
			     (if (file-exists-p file) (load-file file)))))

;;-----------------------------------------------------------------------------
;;; configure languages 
;;-----------------------------------------------------------------------------

(let ((languages
       '(
;;	 "elisp"
	 "rust"
;;	 "cmake"
	 "powershell"
	 )))
  (dolist (language languages)
    (let ((file (concat lm/conf-dir "/languages/" language ".el")))
			     (if (file-exists-p file) (load-file file)))))

;;-----------------------------------------------------------------------------
;;; customizations file 
;;-----------------------------------------------------------------------------
(if (file-exists-p custom-file) (load-file custom-file))
