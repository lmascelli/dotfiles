echo "--------------------------------------------------------------------------"
echo "---                                                                    ---"
echo "---                        LM BOOTSTRAP SCRIPT                         ---"
echo "---                                                                    ---"
echo "---                           Linux version                            ---"
echo "--------------------------------------------------------------------------"
echo 
mkdir -p ~/.lm
mkdir -p ~/.lm/bin
mkdir -p ~/.lm/opt
mkdir -p ~/.lm/tmp
echo "Installing pwsh ..."

PWSH_VERSION="7.3.6"

cd ~/.lm/
mkdir -p ~/.lm/opt/pwsh
if command -v curl &> /dev/null
then
  curl -o ~/.lm/tmp/pwsh.tar.gz -LJO "https://github.com/PowerShell/PowerShell/releases/download/v${PWSH_VERSION}/powershell-${PWSH_VERSION}-linux-x64.tar.gz"
else
  echo "curl not found"
  if command -v wget &> /dev/null 
  then
    wget -P "~/.lm/tmp" -O "tmp/pwsh.tar.gz" "https://github.com/PowerShell/PowerShell/releases/download/v${PWSH_VERSION}/powershell-${PWSH_VERSION}-linux-x64.tar.gz"
  else
    echo "not even wget found"
    echo "ABORT"
    exit
  fi
fi
cd ~/.lm/opt/pwsh
tar -xf ~/.lm/tmp/pwsh.tar.gz

ln -f -s ~/.lm/opt/pwsh/pwsh ~/.lm/bin/pwsh

mkdir -p ~/.config
ln -f -s ~/.lm/dotfiles/configurations/powershell ~/.config/powershell
cp ./start.sh ~
