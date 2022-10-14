Write-Output @"

*******************************************************************************
*                                                                             *
*                         dotfiles symlink                                    *
*                                                                             *
*                                                                             *
*******************************************************************************
"@
$dotfiles_path = Split-Path (Split-Path ($MyInvocation.MyCommand.Path) -Parent) -Parent

function CreateSymlink {
    param (
      $From,
      $To
    )
  New-Item -ItemType SymbolicLink -Path ($dotfiles_path + "/" + $From) -Target ($env:HOME + "/" + $To) -ErrorAction Ignore
  }

if ($IsLinux)
{
  CreateSymlink -From "nvim" -To ".config/nvim"
  CreateSymlink -From "wezterm" -To ".config/wezterm"
  CreateSymlink -From "emacs" -To ".config/emacs"
  CreateSymlink -From "lite-xl" -To ".config/lite-xl"
  CreateSymlink -From "scripts/gh_swap.ps1" -To ".local/bin/gh_swap.ps1"
  CreateSymlink -From "scripts/idpad.ps1" -To ".local/bin/idpad.ps1"
}

if ($IsWindows)
{

}
