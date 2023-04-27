################################################################################
#                                                                              #
#                       WINDOWS INSTALLATION SCRIPT                            #
#                                                                              #
################################################################################

# Global variables
$scoop_dir = 'D:\Scoop'

# Install scoop

Set-ExecutionPolicy RemoteSigned -Scope CurrentUser # Optional: Needed to run a remote script the first time
irm get.scoop.sh -outfile 'install.ps1'
.\install.ps1 -ScoopDir 'D:\Scoop' -ScoopGlobalDir 'D:\Scoop' -NoProxy

scoop install 7zip 
scoop install git
scoop install neovim
scoop install msys2
scoop install wezterm
scoop install pwsh
scoop install miniconda3
scoop held msys2
# scoop bucket add kiennq-scoop
scoop bucket add nerd-fonts
# scoop install emacs-k
