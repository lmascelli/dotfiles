(use-package olivetti
  :defer t
  :ensure t)

;; (add-hook 'rust-ts-mode-hook 'eglot-ensure)
;; (add-hook 'python-mode-hook 'eglot-ensure)

(fido-vertical-mode)
(global-hl-line-mode 1)
(use-package lm-utils)

(use-package whitespace
  :defer t
  :custom
  (set-face-attribute 'whitespace-indentation nil :foreground nil :background nil)
  (set-face-attribute 'whitespace-line nil :foreground nil :background nil)
  (set-face-attribute 'whitespace-space nil :foreground nil :background nil)  
  )
