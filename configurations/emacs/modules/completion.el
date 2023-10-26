(use-package company
  :diminish
  :defer 1
  :init
  (unless (and (display-graphic-p) (not lm/evil-mode))
    (add-hook 'evil-mode-hook (lambda ()
				(keymap-set evil-insert-state-map "C-@" 'company-complete))))
  (setq lm/company t)
  (setq company-dabbrev-ignore-case t)
  (setq company-dabbrev-code-ignore-case t)    
  (setq company-keywords-ignore-case t)
  (setq company-minimum-prefix-length 1)
  (setq company-idle-delay 0.0)
  :config
  ;; (add-to-list 'company-backends '(company-capf :with company-dabbrev))
  (global-company-mode t))

(use-package yasnippet
  :after company
  :config
  (yas-minor-mode)
  (global-set-key (kbd "C-c y") 'company-yasnippet))

(use-package yasnippet-snippets
  :after yasnippet)
