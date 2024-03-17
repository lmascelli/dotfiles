;; -*- lexical-binding: t; -*-

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

  :config
  ;; (add-to-list 'company-backends '(company-capf :with company-dabbrev))
  (setq company-global-modes '(not erc-mode message-mode eshell-mode))
  (global-company-mode t)
  (global-set-key (kbd "C-i") 'company-complete)
  ;; (global-set-key (kbd "<tab>") #'company-indent-or-complete-common)
  (dolist (mode '(eshell-mode-hook))
    (add-hook mode (lambda () (company-mode nil)))))

(use-package yasnippet
  :after company
  :config
  (yas-minor-mode)
  (global-set-key (kbd "C-c y") 'company-yasnippet))

(use-package yasnippet-snippets
  :after yasnippet)
