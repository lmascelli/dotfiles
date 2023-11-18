(unless (boundp 'lm/evil-mode)
  (keymap-set global-map "M-RET" lm/leader-map))
(keymap-set lm/leader-map "RET" 'execute-extended-command)
;; buffers
(keymap-set lm/leader-map "b" `("+Buffer" . ,lm/leader-map-buffer))
(keymap-set lm/leader-map-buffer "d" 'kill-this-buffer)
(keymap-set lm/leader-map-buffer "s" 'save-buffer)
(keymap-set lm/leader-map-buffer "l" 'switch-to-buffer)
(keymap-set lm/leader-map-buffer "L" 'list-buffers)
;; quit
(keymap-set lm/leader-map "q" `("+Quit" . ,lm/leader-map-quit))
(keymap-set lm/leader-map-quit "q" 'save-buffers-kill-terminal)
;; find
(keymap-set lm/leader-map "f" `("+Find" . ,lm/leader-map-find))
(keymap-set lm/leader-map-find "f" 'project-find-file)
(keymap-set lm/leader-map-find "s" 'search-forward)
(keymap-set lm/leader-map-find "b" 'search-backward)
(keymap-set lm/leader-map-find "r" 'query-replace)
;; appearence
(keymap-set lm/leader-map "a" `("+Appearence" . ,lm/leader-map-appearence))
(keymap-set lm/leader-map-appearence "c" 'customize-themes)
(keymap-set lm/leader-map-appearence "t" 'toggle-theme)
(keymap-set lm/leader-map-appearence "m" 'menu-bar-mode)
;; configuration
(keymap-set lm/leader-map "c" `("+Configuration" . ,lm/leader-map-config))
(keymap-set lm/leader-map-config "c" 'lm/open-literate-config)
(keymap-set lm/leader-map-config "r" 'lm/reload-config)
;; project
(keymap-set lm/leader-map "p" `("+Project" . ,lm/leader-map-project))
(keymap-set lm/leader-map-project "c" 'lm/run-wezterm)
(keymap-set lm/leader-map-project "p" 'project-asyn-shell-command)
;; insert
(keymap-set lm/leader-map "i" `("+Insert" . ,lm/leader-map-special-chars))
(keymap-set lm/leader-map-special-chars "t" 'lm/insert-tilde)
(keymap-set lm/leader-map-special-chars "g" 'lm/insert-grave-accent)
;; tools
(keymap-set lm/leader-map "t" `("+Tools" . ,lm/leader-map-tools))
(keymap-set lm/leader-map-tools "p" 'lm/pomodoro)
