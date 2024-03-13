;; -*- lexical-binding: t; -*-

;;-----------------------------------------------------------------------------
;;; global variables
;;-----------------------------------------------------------------------------
;; configuration path
(setq lm/conf-dir (file-truename user-emacs-directory))
(setq lm/dot-dir (file-name-directory (directory-file-name lm/conf-dir)))
(setq lm/sound-dir (concat lm/dot-dir "sounds/"))

;; features
(setq lm/with-lsp nil)
(setq lm/evil     t)

;;-----------------------------------------------------------------------------
;;; startup configuration
;;-----------------------------------------------------------------------------

(let ((modules 
       '("custom-functions"	 
	 "settings"
	 "keymaps"
	 "packages")))
  (dolist (module modules)
    (let ((file (concat lm/conf-dir "/modules/" module ".el")))
      (if (file-exists-p file) (load-file file)))))

;;-----------------------------------------------------------------------------
;;; loading modules 
;;-----------------------------------------------------------------------------

(let ((modules
       '("dired"
	 "grep"
	 "eglot"
	 )))
  (dolist (module modules)
    (let ((file (concat lm/conf-dir "/modules/" module ".el")))
			     (if (file-exists-p file) (load-file file)))))

;;-----------------------------------------------------------------------------
;;; lazy loading
;; there can be two way of loading features:
;; 1. all at the start for a server process
;; 2. lazy at request for a standalone cliend
;;-----------------------------------------------------------------------------

(let ((modules
       '("tree-sitter"
	 "which-key"
	 "evil"
	 "company"
;;	 "ivy"
;;	 "helm"
;;	 "corfu"
;;	 "lsp-mode"
;;	 "terminal-here"
	 )))
  (dolist (module modules)
    (let ((file (concat lm/conf-dir "/modules/" (if (daemonp) "server/" "client/") module ".el")))
			     (if (file-exists-p file) (load-file file)))))


;;-----------------------------------------------------------------------------
;;; custom file
;;-----------------------------------------------------------------------------

(let ((file (concat lm/conf-dir "/emacs-custom.el")))
  (if (file-exists-p file)
      (load-file file)))
