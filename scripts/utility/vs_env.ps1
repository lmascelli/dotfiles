# This script check if the vswhere tool is present and install it if not. Then
# use it to locate the Visual Studio installation and activate the vsvars env

if (-not $IsWindows)
{
  Write-Output "This script is meaningful only on Windows with Visual Studio"
  Exit 1
}

if (-not (Get-Command "vswhere" -ErrorAction SilentlyContinue))
{
  scoop install vswhere
}

$installationPath = vswhere.exe -prerelease -latest -property installationPath
if ($installationPath -and (test-path "$installationPath\Common7\Tools\vsdevcmd.bat")) {
  & "${env:COMSPEC}" /s /c "`"$installationPath\Common7\Tools\vsdevcmd.bat`" -no_logo && set" | foreach-object {
    $name, $value = $_ -split '=', 2
    set-content env:\"$name" $value
  }
}
