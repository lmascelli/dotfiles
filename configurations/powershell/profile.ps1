if ($IsLinux)
{
  $env:PATH += ":~/.local/bin:~/.lm/bin"
} elseif ($IsWindows) {
  $env:PATH += ";$(Convert-Path -ErrorAction Ignore ~/.local/bin)"
  $env:PATH += ";$(Convert-Path -ErrorAction Ignore ~/.lm/bin)"
}
$PSStyle.FileInfo.Directory = "`e[33;1m"

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
