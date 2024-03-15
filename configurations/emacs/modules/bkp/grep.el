;;-----------------------------------------------------------------------------
;;; grep using ripgrep
;;-----------------------------------------------------------------------------
(use-package grep
  :defer t
  :config
  (grep-apply-setting
   'grep-find-command
   '("rg -n -H --no-heading -e  ." . 26)))

