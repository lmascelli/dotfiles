################################################################################
#                                                                              #
#                       GENERAL INSTALLATION SCRIPT                            #
#                                                                              #
################################################################################

################################################################################
# the goal of this script is to automatize the system installation/maintainance
# using powershell. Then, the system should have powershell isntalled first.

if ($Linux)
{
  #############################################################################
  # Install neovim
  
} elseif ($Windows)
{
  # On Windows the scoop and msys2 package managers will be used to install 
  # various software. 
  #
  $scoop_dir = 'D:\Scoop' # TODO make this a parameter of a function and an
                          # argument of the script

  #############################################################################
  # Install scoop
  Set-ExecutionPolicy RemoteSigned -Scope CurrentUser
  Invoke-RestMethod get.scoop.sh -outfile 'install.ps1'
  .\install.ps1 -ScoopDir 'D:\Scoop' -ScoopGlobalDir 'D:\Scoop' -NoProxy

  scoop install git
  scoop install neovim
  scoop install msys2
  scoop install wezterm
  scoop held msys2
  ## emacs?
  # scoop bucket add kiennq-scoop
  # scoop install emacs-k
  scoop bucket add nerd-fonts
}
