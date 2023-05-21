$DotDir = Split-Path -Parent $PSScriptRoot

$PlayWav = New-Object System.Media.SoundPlayer
$PlayWav.SoundLocation = Join-Path $DotDir "\sounds\bell.wav"
$PlayWav.PlaySync()
