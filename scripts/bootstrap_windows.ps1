# the windows bootstrap should install scoop and the base filetree
$ScoopDir = "D:\Scoop"

#########################################################################
# Install scoop
Set-ExecutionPolicy RemoteSigned -Scope CurrentUser
Invoke-RestMethod get.scoop.sh -outfile 'install.ps1'
.\install.ps1 -ScoopDir $ScoopDir -ScoopGlobalDir $ScoopDir -NoProxy

#########################################################################
# Base filetree
New-Item -ItemType Directory -Path '~/.lm' -ErrorAction Ignore
New-Item -ItemType Directory -Path '~/.lm/bin' -ErrorAction Ignore
New-Item -ItemType Directory -Path '~/.lm/opt' -ErrorAction Ignore
New-Item -ItemType Directory -Path '~/.lm/tmp' -ErrorAction Ignore
