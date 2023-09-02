#!/bin/bash 
# Author: Leonardo Mascelli
# pwsh installation script

PWSH_VERSION="7.3.4"

cd ~/.lm/
mkdir -p opt/pwsh
if command -v curl &> /dev/null
then
  curl -o tmp/pwsh.tar.gz -LJO "https://github.com/PowerShell/PowerShell/releases/download/v${PWSH_VERSION}/powershell-${PWSH_VERSION}-linux-x64.tar.gz"
else
  echo "curl not found"
  if command -v wget &> /dev/null 
  then
    wget -O "tmp/pwsh.tar.gz" "https://github.com/PowerShell/PowerShell/releases/download/v${PWSH_VERSION}/powershell-${PWSH_VERSION}-linux-x64.tar.gz"
  else
    echo "not even wget found"
    echo "ABORT"
    exit
  fi
fi
cd opt/pwsh
tar -xf ~/.lm/tmp/pwsh.tar.gz

ln -s ~/.lm/opt/pwsh/pwsh ~/.lm/bin/pwsh
