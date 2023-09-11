if ($IsLinux)
{
  Push-Location ~/.lm/opt
  Invoke-WebRequest -URI "https://github.com/neovim/neovim/releases/download/stable/nvim-linux64.tar.gz" -OutFile ~/.lm/tmp/neovim.tar.gz
  tar -xf ~/.lm/tmp/neovim.tar.gz
  New-Item -Force -Type SymbolicLink -Target (Convert-Path ~/.lm/opt/nvim-linux64/bin/nvim ) (Convert-Path ~/.lm/bin/nvim )
  New-Item -Force -Type SymbolicLink -Target (Convert-Path ~/.lm/dotfiles/configurations/nvim ) (Convert-Path ~/.config/nvim )
  Pop-Location
} elseif ($IsWindows)
{

}
