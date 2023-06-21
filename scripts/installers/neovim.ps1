if ($IsLinux) {
  Push-Location ~/.lm
  Invoke-WebRequest -URI "https://github.com/neovim/neovim/releases/download/stable/nvim-linux64.tar.gz" -OutFile ~/.lm/download/neovim.tar.gz
  tar -xf ~/.lm/download/neovim.tar.gz
  New-Item -ItemType SymbolicLink -Path "~/.config/nvim" -Value "~/.dotfiles/nvim"
  Pop-Location
}
