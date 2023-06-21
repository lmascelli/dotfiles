if ($IsLinux) {
  Push-Location ~/.lm
  Invoke-WebRequest -URI "https://github.com/neovim/neovim/releases/download/stable/nvim-linux64.tar.gz" -OutFile ~/.lm/download/neovim.tar.gz
  tar -xf ~/.lm/download/neovim.tar.gz
  ln -s ~/.lm/nvim-linux64/bin/nvim ~/.local/bin
  ln -s ~/.dotfiles/nvim ~/.config/nvim
  Pop-Location
}
