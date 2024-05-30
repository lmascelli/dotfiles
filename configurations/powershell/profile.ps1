################################################################################
#                          global variables
################################################################################

$LMPath = "~/.lm"
$LM_with_powerline = $true
$LM_with_vimmotions = $true

################################################################################
#                          utility functions
################################################################################

function Script:CheckLMFolder {
  if (-not (Test-Path -Path $LMPath)) { 
    New-Item -Type Directory -Path $LMPath
  }
  if (-not (Test-Path -Path $LMPath/bin)) { 
    New-Item -Type Directory -Path $LMPath/bin
  }
}

# fix the escape code 7 to correctly provide current path to new shells
function prompt {
    $p = $executionContext.SessionState.Path.CurrentLocation
    $osc7 = ""
    if ($p.Provider.Name -eq "FileSystem") {
        $ansi_escape = [char]27
        $provider_path = $p.ProviderPath -Replace "\\", "/"
        $osc7 = "$ansi_escape]7;file://${env:COMPUTERNAME}/${provider_path}${ansi_escape}\"
    }
    "${osc7}PS $p$('>' * ($nestedPromptLevel + 1)) ";
}

# ya function for running yazi file explorer
# yazi configuration https://yazi-rs.github.io/
function ya {
    $tmp = [System.IO.Path]::GetTempFileName()
    yazi $args --cwd-file="$tmp"
    $cwd = Get-Content -Path $tmp
    if (-not [String]::IsNullOrEmpty($cwd) -and $cwd -ne $PWD.Path) {
        Set-Location -Path $cwd
    }
    Remove-Item -Path $tmp
}

################################################################################
#                          configure profile routing
################################################################################
# check if the .lm folder exists. if not create it and install some utilities
CheckLMFolder

# add .lm folders to path
if ($IsLinux)
{
  $env:PATH = "~/.local/bin:~/.lm/bin:" + $env:PATH
} elseif ($IsWindows) {
  $env:PATH += ";$(Convert-Path -ErrorAction Ignore ~/.local/bin)"
  $env:PATH += ";$(Convert-Path -ErrorAction Ignore ~/.lm/bin)"
}

# vim motion in powershell
if ($LM_with_vimmotions) {
  if (-not (Get-Module -ListAvailable -Name PSReadLine)) {
    Install-Module -Name PSReadLine -AllowClobber -Force
  }
  Set-PSReadLineOption -EditMode Vi -ViModeIndicator Cursor
}

# change the color of directories in the output of Get-ChildItems
$PSStyle.FileInfo.Directory = "`e[33;1m"

# activate powerline theme
if ($LM_with_powerline) {
  if (-not (Get-Command oh-my-posh -ErrorAction Ignore)) {
    if ($IsLinux) {
      curl -s https://ohmyposh.dev/install.sh | bash -s -- -d ~/.lm/bin
    } elseif ($IsWindows) {
      scoop install https://github.com/JanDeDobbeleer/oh-my-posh/releases/latest/download/oh-my-posh.json
    }
  }
  oh-my-posh init pwsh | Invoke-Expression
}
