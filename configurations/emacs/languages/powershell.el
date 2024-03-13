(if (boundp 'start-process)
    ;; server process case
    (progn
      (use-package koopa-mode
	:defer nil
	:init
	(require 'koopa-mode))
      
      ;; (use-package powershell    
      ;;   :defer t
      ;;   :init
      ;;   (setq compile-command "pwsh -c ")
      ;;   :commands powershell)

    (use-package ob-powershell
      :after org))
  (progn
    (use-package koopa-mode
      :defer t
      :mode ("*.ps1" . koopa-mode)
      :config
      (require 'koopa-mode))
    
    (use-package ob-powershell
      :after org)))
