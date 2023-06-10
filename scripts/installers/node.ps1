if ($IsLinux) {
  Push-Location ~/.lm
  $node_version = "18.16.0"
  Invoke-WebRequest -URI "https://nodejs.org/dist/v$($node_version)/node-v$($node_version)-linux-x64.tar.xz" -OutFile ~/.lm/download/node.tar.xz
  tar -xf ~/.lm/download/node.tar.xz
  ln -s "~/.lm/node-v$($node_version)-linux-x64/bin/node" ~/.local/bin/node
  ln -s "~/.lm/node-v$($node_version)-linux-x64/bin/npm" ~/.local/bin/npm
  Pop-Location
}
