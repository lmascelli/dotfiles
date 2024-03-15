;; -*- lexical-binding: t; -*-

(use-package ivy
  :diminish
  :bind (:map ivy-minibuffer-map
	 ("TAB" . ivy-alt-done)
	 ("C-l" . ivy-alt-done)
	 ("C-j" . ivy-next-line)
	 ("C-k" . ivy-previous-line)
	 :map ivy-switch-buffer-map
	 ("C-k" . ivy-previous-line)
	 ("C-l" . ivy-done)
	 ("C-d" . ivy-switch-buffer-kill)
	 :map ivy-reverse-i-search-map
	 ("C-k" . ivy-previous-line)
	 ("C-d" . ivy-reverse-i-search-kill))
  :config
  (ivy-mode))

(use-package counsel
  :after ivy
  :config
  (counsel-mode 1))

(use-package helpful
  :after counsel
  :custom
  (counsel-describe-function-function #'helpful-callable)
  (counsel-describe-variable-function #'helpful-variable)
  :bind
  ([remap describe-function] . counsel-descrive-function)
  ([remap describe-command] . helpful-function)
  ([remap describe-variable] . counsel-descrive-variable)
  ([remap describe-key] . helpful-key))
  
(use-package ivy-rich
  :after counsel
  :init
  (ivy-rich-mode 1))
