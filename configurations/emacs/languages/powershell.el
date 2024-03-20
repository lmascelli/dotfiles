(setq compile-command "pwsh -c ")

(use-package koopa-mode
  :mode ("\\.ps1\\'" . koopa-mode))

(use-package ob-powershell
  :after org)
