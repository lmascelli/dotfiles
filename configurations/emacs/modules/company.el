;; -*- lexical-binding: t; -*-

(let (nested)
  (defun lm/switch-icomplete-when-in-eshell-mode ()
    (when (and (not nested) (derived-mode-p 'eshell-mode))
      (setq nested t)
      (setq lm/completef 'company-complete-common)
      (setq nested nil))))


(use-package company
  :defer 1
  :init
  ;; (unless (and (display-graphic-p) lm/evil)
  ;;   (add-hook 'evil-mode-hook (lambda ()
  ;; 				(keymap-set evil-insert-state-map "C-@" 'company-complete))))
  (setq lm/company t)
  (setq company-dabbrev-ignore-case t)
  (setq company-dabbrev-code-ignore-case t)    
  (setq company-keywords-ignore-case t)
  (setq company-minimum-prefix-length 1)
  (setq company-idle-delay 0.0)
  (add-hook 'eshell-mode-hook (lambda () (setq lm/completef 'completion-at-point)))
  (add-hook 'buffer-list-update-hook 'lm/switch-icomplete-when-in-eshell-mode)
  (setq lm/completef 'company-complete-common)
  :config
  ;; (add-to-list 'company-backends '(company-capf :with company-dabbrev))
  (setq company-global-modes '(not erc-mode message-mode eshell-mode))
  (global-company-mode t)
  (dolist (mode '(eshell-mode-hook))
    (add-hook mode (lambda () (company-mode -1)))))

(use-package yasnippet
  :after company
  :config
  (yas-minor-mode)
  (global-set-key (kbd "C-c y") 'company-yasnippet))

(use-package yasnippet-snippets
  :after yasnippet)
