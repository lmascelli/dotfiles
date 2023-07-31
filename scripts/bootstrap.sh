PWSH_VERSION="7.3.5"

# Create the folder structure
mkdir -p ~/.lm
mkdir -p ~/.lm/bin
mkdir -p ~/.lm/packages
mkdir -p ~/.lm/lsps
mkdir -p ~/.lm/tmp

# Clear possible previous powershell instance
rm -rf ~/.lm/packages/pwsh

# Download powershell
# Try using curl
if command -v curl &> /dev/null
then
    curl -o ~/.lm/tmp/pwsh.tar.gz -LJO "https://github.com/PowerShell/PowerShell/releases/download/v${PWSH_VERSION}/powershell-${PWSH_VERSION}-linux-x64.tar.gz"
else
    echo "curl not found. Trying using wget..."
    if command -v wget &> /dev/null 
    then
	wget -O "~/.lm/tmp/pwsh.tar.gz" "https://github.com/PowerShell/PowerShell/releases/download/v${PWSH_VERSION}/powershell-${PWSH_VERSION}-linux-x64.tar.gz"
    else
	echo "not even wget found. Download pwsh manually"
	echo "ABORT"
	exit
    fi
fi

cd ~/.lm/packages
mkdir -p pwsh
cd pwsh
tar -xf ~/.lm/tmp/pwsh.tar.gz

ln -s ~/.lm/packages/pwsh/pwsh ~/.lm/bin/pwsh
