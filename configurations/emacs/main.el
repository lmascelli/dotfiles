;; -*- lexical-binding: t; -*-

;;-----------------------------------------------------------------------------
;
;; global variables
;;-----------------------------------------------------------------------------

;; configuration path
(setq lm/conf-dir (file-truename user-emacs-directory))
(setq lm/dot-dir (file-name-directory (directory-file-name lm/conf-dir)))
(setq lm/sound-dir (concat lm/dot-dir "sounds/"))

;; features
(setq lm/completef 'completion-at-point)
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

;; built-in
(let ((modules
       '("dired"
	 "grep"
	 "eglot"
	 "org"
	 "fido"                 ;; disable ivy if you want to enable this
	 )))
  (dolist (module modules)
    (let ((file (concat lm/conf-dir "/modules/" module ".el")))
			     (if (file-exists-p file) (load-file file)))))

;; packages
(let ((modules
       '(;;"evil"
	 "which-key"
	 "corfu"
	 ;; "tree-sitter"
	 ;; "ivy"                 ;; disable fido if you want to enable this
	 ;; "eat"
	 ;; "helm"
	 ;; "lsp-mode"
	 "doom-modeline"
	 ;; "doom-themes"
	 ;; "raibow-delimiters"
	 )))
  (dolist (module modules)
    (let ((file (concat lm/conf-dir "/modules/"  module ".el")))
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
;;; custom file
;;-----------------------------------------------------------------------------

(let ((file (concat lm/conf-dir "/emacs-custom.el")))
  (if (file-exists-p file)
      (load-file file)))
