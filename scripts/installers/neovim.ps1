if ($IsLinux)
{
  Push-Location ~/.lm/opt
  Invoke-WebRequest -URI "https://github.com/neovim/neovim/releases/download/stable/nvim-linux64.tar.gz" -OutFile ~/.lm/tmp/neovim.tar.gz
  tar -xf ~/.lm/tmp/neovim.tar.gz
  New-Item -Type SymbolicLink -Target ~/.lm/opt/nvim-linux/bin/nvim ~/.lm/bin
  New-Item -Type SymbolicLink -Target ~/.lm/dotfiles/configurations/nvim ~/.config/nvim
  Pop-Location
} elseif ($IsWindows)
{

}
