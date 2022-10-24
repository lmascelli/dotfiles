Write-Output @"

*******************************************************************************
*                                                                             *
*                         dotfiles symlink                                    *
*                                                                             *
*                                                                             *
*******************************************************************************
"@
$dotfiles_path = Split-Path (Split-Path ($MyInvocation.MyCommand.Path) -Parent) -Parent


if ($IsLinux)
{
  function CreateSymlink
  {
    param (
      $From,
      $To
    )
    New-Item -ItemType SymbolicLink -Target($dotfiles_path + "/" + $From) -Path ($env:HOME + "/" + $To) -ErrorAction Ignore
  }

  CreateSymlink -From "nvim" -To ".config/nvim"
  CreateSymlink -From "wezterm" -To ".config/wezterm"
  CreateSymlink -From "emacs" -To ".config/emacs"
  CreateSymlink -From "lite-xl" -To ".config/lite-xl"
  CreateSymlink -From "scripts/gh_swap.ps1" -To ".local/bin/gh_swap.ps1"
  CreateSymlink -From "scripts/idpad.ps1" -To ".local/bin/idpad.ps1"
}

if ($IsWindows)
{
  function CreateSymlink
  {
    param (
      $From,
      $To
    )
    New-Item -ItemType SymbolicLink -Target($dotfiles_path + "\" + $From) -Path $To -ErrorAction Ignore
  }

  CreateSymlink -From "nvim" -To ($env:LOCALAPPDATA + "\nvim")
  CreateSymlink -From "wezterm" -To ($env:LOCALAPPDATA + "\wezterm")
  CreateSymlink -From "emacs" -To ($env:LOCALAPPDATA + "\emacs")
  CreateSymlink -From "clangd" -To ($env:LOCALAPPDATA + "\clangd")
}
