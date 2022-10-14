Write-Output @"
*******************************************************************************
*                                                                             *
*                         dotfiles symlink                                    *
*                                                                             *
*                                                                             *
*******************************************************************************
"@
$dotfiles_path = Split-Path (Split-Path ($MyInvocation.MyCommand.Path) -Parent) -Parent

if ($IsLinux) {
  ln -s ($dotfiles_path + "/nvim") ($env:HOME + "/.config/nvim")
  ln -s ($dotfiles_path + "/wezterm") ($env:HOME + "/.config/wezterm")
  ln -s ($dotfiles_path + "/emacs") ($env:HOME + "/.config/emacs")
  ln -s ($dotfiles_path + "/lite-xl") ($env:HOME + "/.config/lite-xl")
  ln -s ($dotfiles_path + "/scripts/gh_swap.ps1") ($env:HOME + "/.local/bin/gh_swap.ps1")
}

if ($IsWindows) {

  }
