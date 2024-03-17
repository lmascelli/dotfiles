(setq compile-command "pwsh -c ")

(use-package koopa-mode
  :mode ("\\.ps1\\'" . koopa-mode)
  :init
  (require 'koopa-mode))

(use-package ob-powershell
  :after org)
