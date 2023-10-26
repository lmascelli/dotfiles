(use-package powershell    
  :defer t
  :init
  (setq compile-command "pwsh -c ./project.ps1 ")
  :commands powershell)

(use-package ob-powershell
  :after org)
