switch ($args[0]) {
  "-s" {
    git clone https://github.com/neovim/neovim.git --depth=1
    cd neovim
    cmake -S cmake.deps -B .deps -G Ninja -DCMAKE_BUILD_TYPE=RelWithDebInfo -DUSE_BUNDLED=ON -DUSE_BUNDLED_TS=ON
    cmake --build .deps
    $path = Join-Path -Path $PWD -ChildPath "install"
    cmake -B build -G Ninja -DCMAKE_BUILD_TYPE=RelWithDebInfo -DCMAKE_INSTALL_PREFIX="$path"
    cmake --build build --config RelWithDebInfo
    make install
  }

  default {
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

  }
}
