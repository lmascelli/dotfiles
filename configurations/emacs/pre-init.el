(setq lm/pylsp-path "~/.local/.lsp/bin/pylsp")
(setq lm/pses-path "/home/leonardo/Downloads/pses")
(setq lm/pses-log-path "/home/leonardo/tmp")

(setq lm/literate-config-name "init.org")
(setq lm/dot-dir (file-name-directory (directory-file-name lm-emacs-user-directory)))
(setq lm/sound-dir (concat lm/dot-dir "sounds/"))

(defcustom lm-input-mode 'evil
  "The keymap mode to use."
  :type '(choice
          (const :tag "evil" evil)
          (const :tag "emacs" emacs))
  :group 'lm)

(defcustom lm-lsp-client nil
  "The LSP implementation to use."
  :type '(choice
          (const :tag "eglot" eglot)
          (const :tag "lsp-mode" lsp-mode)
          (const :tag "none" nil))
  :group 'lm)

(defcustom lm-in-buffer-completion 'company
  "The in-buffer completion to use."
  :type '(choice
          (const :tag "corfu" corfu)
          (const :tag "company" company)
          (const :tag "none" nil))
  :group 'lm)

(defcustom lm-ligatures 'off
  "Enables fonts ligatures."
  :type '(choice
          (const :tag "on" 1)
          (const :tag "off" nil))
  :group 'lm)

(defun lm/complete ()
  (interactive)
  nil)

(defun lm/run-wezterm ()
  (interactive)
  (start-process "wezterm" nil "wezterm" "start" "--cwd"
                 default-directory))

(defun lm/insert-tilde ()                                      
  (interactive)                                 
  (insert-char (char-from-name "TILDE")))
(defun lm/insert-grave-accent ()                                      
  (interactive)                                 
  (insert-char (char-from-name "GRAVE ACCENT")))

(defun lm/get-conf-org-dir ()
  (interactive)
  (file-name-directory buffer-file-name))

(defun lm/switch-to-tab-1 ()
  (interactive)
  (tab-bar-select-tab 1))
(defun lm/switch-to-tab-2 ()
  (interactive)
  (tab-bar-select-tab 2))
(defun lm/switch-to-tab-3 ()
  (interactive)
  (tab-bar-select-tab 3))

(defun lm/open-literate-config ()
  (interactive)
  (find-file (concat lm-emacs-user-directory lm/literate-config-name)))

(defun lm/reload-config ()
  (interactive)
  (load (concat user-emacs-directory "init.el")))

(defun lm/pomodoro ()
  (interactive)
  (require 'org-element)
  (setq org-clock-sound (concat lm/sound-dir "bell.wav"))
  (unless (boundp 'lm/pomodoro-state)
    (setq lm/pomodoro-state 0))
  (let ((time-work "00:25:00")
        (time-pause "00:05:00"))
    (org-timer-set-timer
     (cond
      ((= (mod lm/pomodoro-state 2) 0) time-work)
      ((= (mod lm/pomodoro-state 3) 0) time-work)
      (t time-pause)))
    (setq lm/pomodoro-state (+ lm/pomodoro-state 1))))
