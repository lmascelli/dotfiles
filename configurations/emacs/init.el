;;-----------------------------------------------------------------------------
;;; global variables
;;-----------------------------------------------------------------------------
;; configuration path
(setq lm/conf-dir (file-truename user-emacs-directory))
(setq lm/dot-dir (file-name-directory (directory-file-name lm/conf-dir)))
(setq lm/sound-dir (concat lm/dot-dir "sounds/"))

;;-----------------------------------------------------------------------------
;;; make leader keymaps
;;-----------------------------------------------------------------------------

(defvar lm/leader-map (make-sparse-keymap) "Keymap for \"leader key\" shortcuts")
(defvar lm/leader-map-buffer (make-sparse-keymap) "sub-keymap for buffer operations")
(defvar lm/leader-map-quit (make-sparse-keymap) "sub-keymap for quit operations")
(defvar lm/leader-map-find (make-sparse-keymap) "sub-keymap for finding operations")
(defvar lm/leader-map-appearence (make-sparse-keymap) "sub-keymap for customizing appearence operations")
(defvar lm/leader-map-config (make-sparse-keymap) "sub-keymap for customizing configuration operations")
(defvar lm/leader-map-project (make-sparse-keymap) "sub-keymap for customizing project operations")
(defvar lm/leader-map-special-chars (make-sparse-keymap) "sub-keymap for inserting special characters")
(defvar lm/leader-map-tools (make-sparse-keymap) "sub-keymap for tools")

;;-----------------------------------------------------------------------------
;;; loading modules 
;;-----------------------------------------------------------------------------

(let ((modules
       '("settings"
	 "packages"
	 "leader" ;; leader related keymaps. should be the last of the list
	 "tree-sitter"
	 "dired"
	 "grep"
	 "which-key"
;;	 "evil"
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
