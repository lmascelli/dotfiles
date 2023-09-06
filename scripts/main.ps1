################################################################################
#                                                                              #
#                       GENERAL INSTALLATION SCRIPT                            #
#                                                                              #
################################################################################

################################################################################
# the goal of this script is to automatize the system installation/maintainance
# using powershell. Then, the system should have powershell isntalled first.

if ($Linux) {
	#########################################################################
	# Install neovim
  
}
elseif ($Windows) {
	# On Windows the scoop and msys2 package managers will be used to install
	# various software. 
	#
	$ScoopDir = "D:\Scoop"

	#########################################################################
	# Install scoop
	Set-ExecutionPolicy RemoteSigned -Scope CurrentUser
	Invoke-RestMethod get.scoop.sh -outfile 'install.ps1'
	.\install.ps1 -ScoopDir $ScoopDir -ScoopGlobalDir $ScoopDir -NoProxy

	scoop install git
	scoop install pwsh

	scoop install msys2
	scoop hold msys2
	'pacman -Syyu --noconfirm' | msys2
	'pacman -Syyu --noconfirm' | msys2
	'pacman -S --noconfirm mingw-w64-x86_64-toolchain' | msys2
	'pacman -S --noconfirm mingw-w64-x86_64-neovim-qt' | msys2
	'pacman -S --noconfirm mingw-w64-x86_64-cmake' | msys2

	scoop bucket add extras
	scoop bucket add nerd-fonts
	scoop bucket add kiennq-scoop
	scoop install wezterm

    Remove-Item "$($env:LOCALAPPDATA)/Microsoft/WindowsApps/python*"

    Invoke-WebRequest -Uri "https://raw.githubusercontent.com/el3um4s/Tastiera-Italiana-Con-Tilde-Backtick/master/release/ItalianoPerSviluppatori.zip" -OutFile ""
    
}
