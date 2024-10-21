(use-package evil
  :defer 1
  :init
  (setq lm/evil-mode t)
  (setq evil-want-integration t)
  (setq evil-want-keybinding nil)
  (unless (display-graphic-p) (setq evil-want-C-i-jump nil))
  (setq evil-undo-system 'undo-redo)
  (defvar lm/leader-map (make-sparse-keymap)
    "Keymap for \"leader key\" shortcuts")
  :config
  ;; ----------------------------- LEADER KEYMAPS ------------------------------
  (keymap-set evil-normal-state-map "SPC" lm/leader-map)
  (keymap-set evil-motion-state-map "SPC" lm/leader-map)
  (keymap-set lm/leader-map "SPC" 'execute-extended-command)
  (defvar lm/leader-map-buffer (make-sparse-keymap)
    "sub-keymap for buffer operations")
  (keymap-set lm/leader-map "b" `("+Buffer" . ,lm/leader-map-buffer))
  (keymap-set lm/leader-map-buffer "d" 'kill-this-buffer)
  (keymap-set lm/leader-map-buffer "s" 'save-buffer)
  (keymap-set lm/leader-map-buffer "l" 'switch-to-buffer)
  (keymap-set lm/leader-map-buffer "L" 'list-buffers)
  (defvar lm/leader-map-quit (make-sparse-keymap)
    "sub-keymap for quit operations")
  (keymap-set lm/leader-map "q" `("+Quit" . ,lm/leader-map-quit))
  (keymap-set lm/leader-map-quit "q" 'save-buffers-kill-terminal)
  (defvar lm/leader-map-find (make-sparse-keymap)
    "sub-keymap for finding operations")
  (keymap-set lm/leader-map "f" `("+Find" . ,lm/leader-map-find))
  (keymap-set lm/leader-map-find "f" 'project-find-file)
  (keymap-set lm/leader-map-find "s" 'evil-search-forward)
  (keymap-set lm/leader-map-find "b" 'evil-search-backward)
  (keymap-set lm/leader-map-find "r" 'query-replace)
  (defvar lm/leader-map-appearence (make-sparse-keymap)
    "sub-keymap for customizing appearence operations")
  (keymap-set lm/leader-map "a" `("+Appearence" . ,lm/leader-map-appearence))
  (keymap-set lm/leader-map-appearence "c" 'customize-themes)
  (keymap-set lm/leader-map-appearence "t" 'toggle-theme)
  (keymap-set lm/leader-map-appearence "m" 'menu-bar-mode)
  (defvar lm/leader-map-config (make-sparse-keymap)
    "sub-keymap for customizing configuration operations")
  (keymap-set lm/leader-map "c" `("+Configuration" . ,lm/leader-map-config))
  (keymap-set lm/leader-map-config "c" 'lm/open-literate-config)
  (keymap-set lm/leader-map-config "r" 'lm/reload-config)
  (keymap-set lm/leader-map-config "v" 'evil-mode)
  (defvar lm/leader-map-project (make-sparse-keymap)
    "sub-keymap for customizing project operations")
  (keymap-set lm/leader-map "p" `("+Project" . ,lm/leader-map-project))
  (keymap-set lm/leader-map-project "c" 'lm/run-wezterm)
  (keymap-set lm/leader-map-project "p" 'project-asyn-shell-command)
  (defvar lm/leader-map-special-chars (make-sparse-keymap)
    "sub-keymap for inserting special characters")
  (keymap-set lm/leader-map "i" `("+Insert" . ,lm/leader-map-special-chars))
  (keymap-set lm/leader-map-special-chars "t" 'lm/insert-tilde)
  (keymap-set lm/leader-map-special-chars "g" 'lm/insert-grave-accent)
  (defvar lm/leader-map-tools (make-sparse-keymap)
    "sub-keymap for tools")
  (keymap-set lm/leader-map "t" `("+Tools" . ,lm/leader-map-tools))
  (keymap-set lm/leader-map-tools "p" 'lm/pomodoro)
  ;; ------------------------- NORMAL STATE KEYMAPS ----------------------------
  (keymap-set evil-normal-state-map "H" 'previous-buffer)
  (keymap-set evil-normal-state-map "L" 'next-buffer)
  (keymap-set evil-normal-state-map "U" 'undo-redo)
  (keymap-set evil-normal-state-map "C-w C-h" 'evil-window-left)
  (keymap-set evil-normal-state-map "C-w C-l" 'evil-window-right)
  (keymap-set evil-normal-state-map "C-w C-j" 'evil-window-down)
  (keymap-set evil-normal-state-map "C-w C-k" 'evil-window-up)
  ;; (define-key evil-normal-state-map (kbd "TAB") 'evil-indent-line)
  ;; ------------------------- VISUAL STATE KEYMAPS ----------------------------
  ; (define-key evil-visual-state-map (kbd "TAB") 'evil-indent)
  ;; ------------------------- INSERT STATE KEYMAPS ----------------------------
  (keymap-set evil-insert-state-map "C-g" 'evil-normal-state)
  (keymap-set evil-insert-state-map "C-SPC" 'completion-at-point)
  (defvar lm/insert-map (make-sparse-keymap)
    "Keymap for shortcuts in insert mode")
  (keymap-set evil-insert-state-map "C-c" lm/insert-map)
  (defvar lm/insert-map-special-chars (make-sparse-keymap)
    "sub-keymap for inserting special characters")
  (keymap-set lm/insert-map "s" `("+Special" . ,lm/insert-map-special-chars))
  (keymap-set lm/insert-map-special-chars "t" 'lm/insert-tilde)
  (keymap-set lm/insert-map-special-chars "g" 'lm/insert-grave-accent)
  ;; ----------------------------- GLOBAL KEYMAPS ------------------------------
  (keymap-set global-map "C-s" 'save-buffer)
  (keymap-set global-map "M-1" 'lm/switch-to-tab-1)
  (keymap-set global-map "M-2" 'lm/switch-to-tab-2)
  (keymap-set global-map "M-3" 'lm/switch-to-tab-3)
  (unless (display-graphic-p)
    (keymap-set evil-insert-state-map "C-_" 'lm/complete))
  ;; ---------------------------------------------------------------------------

  ;; change cursor form in terminal
  (unless (display-graphic-p)
    (add-hook 'evil-insert-state-entry-hook (lambda () (send-string-to-terminal "\033[5 q")))
    (add-hook 'evil-insert-state-exit-hook  (lambda () (send-string-to-terminal "\033[2 q"))))

  (evil-mode))
(use-package evil-collection
  :after evil
  :custom (evil-collection-want-unimpaired-p nil)
  :init
  (setq evil-collection-key-blacklist '("SPC"))
  :config
  (evil-collection-init))

(use-package which-key
  :diminish
  :config
  (which-key-mode)
  (setq which-key-idle-delay 0.1)
  (which-key-setup-minibuffer))

(use-package yasnippet
  :after company
  :config
  (yas-minor-mode)
  (global-set-key (kbd "C-c y") 'company-yasnippet))

(use-package yasnippet-snippets
  :after yasnippet)

(use-package company
  :diminish
  :defer 1
  :init
  (setq lm/company t)
  (defun lm/complete ()
    (interactive)
    (company-complete))
  (setq company-dabbrev-ignore-case t)
  (setq company-dabbrev-code-ignore-case t)    
  (setq company-keywords-ignore-case t)
  (setq company-minimum-prefix-length 1)
  (setq company-idle-delay 0.3)
  :config
  ;; (add-to-list 'company-backends '(company-capf :with company-dabbrev))
  (defun lm/company-format-margin (candidate selected)
    "Format the margin with the backend name."
    (let ((backend (company-call-backend 'annotation candidate)))
      (if backend
          (format " [%s]" backend)
        "")))
  (setq company-format-margin-function 'lm/company-format-margin)

  (global-company-mode t))

(use-package eat
  :config
  (defun eat-default-shell () "pwsh")
  (setq eat-default-shell-function '(lambda () "pwsh"))
  )

(use-package terminal-here 
  :config
  (if (executable-find "wezterm")
      (progn
        (add-to-list 'terminal-here-terminal-command-table
                     '(wezterm . (lambda (dir) '("wezterm"))))
        (setq terminal-here-terminal-command 'wezterm))))

(setq modus-themes-headings
      '((1 . (variable-pitch light 1.4))))

(use-package doom-themes)

(use-package nerd-icons)
(use-package doom-modeline
  :init (doom-modeline-mode 1)
  :custom ((doom-modeline-height 25)))

(use-package cmake-mode
  :mode ("\\CMakeLists.txt" . cmake-mode))

(add-to-list 'auto-mode-alist '("\\.ino\\'" .
                                (lambda ()
                                  (c-or-c++-mode)
                                  (setq lsp-clients-clangd-args
                                        `(
                                          "-j=2"
                                          "--background-index"
                                          "--clang-tidy"
                                          "--completion-style=detailed"
                                          (concat "--query-driver=" (getenv-internal "HOME") "/.platformio/packages/toolchain-atmelavr/bin/avr-g++"))))))

(use-package python-black
  :after python-mode)
(setq python-indent-offset 2)

(add-to-list 'auto-mode-alist '("\\.rs\\'" . rust-ts-mode))
