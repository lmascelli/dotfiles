################################################################################
#                                                                              #
#                       GENERAL INSTALLATION SCRIPT                            #
#                                                                              #
################################################################################

################################################################################
# the goal of this script is to automatize the system installation/maintainance
# using powershell. Then, the system should have powershell isntalled first.

if ($IsLinux)
{
  # NOTE Linux is a bit more complicated to generalize because there are more
  # distributions and package managers to use. The default configuration will
  # be for a remote machine so just a minimal setup will be made, but a way to
  # check if this setup must be skipped in favor of a managed install must be
  # provided.

  #########################################################################
  # Install neovim
  
} elseif ($IsWindows)
{
  # On Windows the scoop and msys2 package managers will be used to install
  # various software. 
  
  scoop install git
  scoop install pwsh

  scoop install msys2
  scoop hold msys2
  'pacman -Syyu --noconfirm' | msys2
  'pacman -Syyu --noconfirm' | msys2
  'pacman -S --noconfirm mingw-w64-x86_64-toolchain' | msys2
  'pacman -S --noconfirm mingw-w64-x86_64-neovim-qt' | msys2
  'pacman -S --noconfirm mingw-w64-x86_64-ripgrep' | msys2
  'pacman -S --noconfirm mingw-w64-x86_64-fd' | msys2
  'pacman -S --noconfirm mingw-w64-x86_64-cmake' | msys2

  scoop bucket add extras
  scoop bucket add nerd-fonts
  scoop bucket add kiennq-scoop
  scoop install wezterm
  scoop install miniconda3
  scoop hold miniconda3
  conda config --add channels conda-forge
  conda config --set channel_priority strict
  conda install pynvim

  Remove-Item "$($env:LOCALAPPDATA)/Microsoft/WindowsApps/python*"

  # install developer keyboard with ` and ~
  Invoke-WebRequest -Uri "https://raw.githubusercontent.com/el3um4s/Tastiera-Italiana-Con-Tilde-Backtick/master/release/ItalianoPerSviluppatori.zip" `
    -OutFile "~/.lm/tmp/kbd.zip"
  Expand-Archive -Path "~/.lm/tmp/kbd.zip" -DestinationPath "~/.lm/tmp/"
  Write-Host @"
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
Installing italian keyboard with support for ` and ~ ...
"@
  ~/.lm/tmp/kbd/ita4js/setup.exe
}
