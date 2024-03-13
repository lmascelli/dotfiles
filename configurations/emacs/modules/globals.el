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
