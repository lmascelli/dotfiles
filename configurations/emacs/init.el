;;-----------------------------------------------------------------------------
;;; global variables
;;-----------------------------------------------------------------------------
;; configuration path
(setq lm/conf-dir (file-truename user-emacs-directory))
(setq lm/dot-dir (file-name-directory (directory-file-name lm/conf-dir)))
(setq lm/sound-dir (concat lm/dot-dir "sounds/"))

;; features
(setq lm/with-lsp nil)
(setq lm/evil     nil)

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
	 "terminal-here"
	 "evil"
	 "eglot"
	 "corfu"
;;	 "company"
;;	 "lsp-mode"
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
