#!/bin/bash 
# Author: Leonardo Mascelli
# pwsh installation script

PWSH_VERSION="7.3.4"

echo Here
mkdir -p ~/.lm/download
cd ~/.lm
mkdir pwsh
curl -o download/pwsh.tar.gz -LJO "https://github.com/PowerShell/PowerShell/releases/download/v${PWSH_VERSION}/powershell-${PWSH_VERSION}-linux-x64.tar.gz"
cd pwsh
tar -xf ../download/pwsh.tar.gz
mkdir -p ~/.local/bin

# eventually add ~/.local/bin to PATH with
# export PATH="~/.local/bin:$PATH"
# or put it in .bashrc

ln -s ~/.lm/pwsh/pwsh ~/.local/bin/pwsh
