Push-Location ~
New-Item -Type Directory -OnError Ignore -Path ".lm"
New-Item -Type Directory -OnError Ignore -Path ".lm/bin"
New-Item -Type Directory -OnError Ignore -Path ".lm/packages"
New-Item -Type Directory -OnError Ignore -Path ".lm/lsps"
New-Item -Type Directory -OnError Ignore -Path ".lm/tmp"
Pop-Location
