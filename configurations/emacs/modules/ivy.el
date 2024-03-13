(use-package ivy
  :diminish
  :bind (("c-s" . swiper)
         :map ivy-minibuffer-map
         ("tab" . ivy-alt-done)	
         ("c-l" . ivy-alt-done)
         ("c-j" . ivy-next-line)
         ("c-k" . ivy-previous-line)
         :map ivy-switch-buffer-map
         ("c-k" . ivy-previous-line)
         ("c-l" . ivy-done)
         ("c-d" . ivy-switch-buffer-kill)
         :map ivy-reverse-i-search-map
         ("c-k" . ivy-previous-line)
         ("c-d" . ivy-reverse-i-search-kill))
  :config
  (ivy-mode))

(use-package counsel
  :after ivy
  :config
  (counsel-mode))

(use-package swiper
  :after ivy)
