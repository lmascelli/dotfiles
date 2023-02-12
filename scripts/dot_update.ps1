# Installation an update of the system in an unique file. WOW

#-------------------------------------------------------------------------------
#
#                            GLOBAL VARIABLES
#
#-------------------------------------------------------------------------------

$LM_Config_File_Path = "~/lmconfig"

$global:Glob = @{
    InstallPath = $null
    ConfigPath = $null
    BinPath = $null
}


#-------------------------------------------------------------------------------
#
#                            UTILITY FUNCTIONS
#
#-------------------------------------------------------------------------------

Function LM_Read {
    param (
	$Prompt
    )
    $ret = Read-Host -Prompt $Prompt
    if ($ret -eq "") {
	return $null
    } else {
	return $ret
    }
}


#-------------------------------------------------------------------------------
#
#                            CONFIGURATION OBJECT
#
#-------------------------------------------------------------------------------

Function LM_Init_Glob {
    $global:Glob.InstallPath = LM_read -Prompt "Insert folder where to install dotfiles"    
    $global:Glob.ConfigPath = LM_read -Prompt "Insert folder where to save config"
    $global:Glob.BinPath = LM_read -Prompt "Insert folder where to store bin"
}

Function LM_Save_Glob {
    ConvertTo-Json $global:Glob | Set-Content -Path $LM_Config_File_Path -Force
}

Function LM_Read_Glob {
    $global:Glob = (Get-Content -Path $LM_Config_File_Path | ConvertFrom-Json )
}


#-------------------------------------------------------------------------------
#
#                              PACKAGE MANAGER
#
#-------------------------------------------------------------------------------


#-------------------------------------------------------------------------------
#
#                                 WEZTERM
#
#-------------------------------------------------------------------------------


Function Update-Wezterm {
    scoop update wezterm

    Copy-Item -Force -Path $global:Glob.InstallPath/wezterm -Destination $global:Glob.ConfigPath -Recurse
}


#-------------------------------------------------------------------------------
#
#                                 SCRIPTS
#
#-------------------------------------------------------------------------------


Function Update-Scripts {
    $path = 
    Copy-Item -Force -Path ($global:Glob.InstallPath + "/scripts/*") -Destination $global:Glob.BinPath -Recurse
}


#-------------------------------------------------------------------------------
#
#                                 MAIN
#
#-------------------------------------------------------------------------------

if (Test-Path $LM_Config_File_Path) { 
    LM_Read_Glob
    Write-Output $Glob
} else {
    LM_Init_Glob
    LM_Save_Glob
}

if ($isWindows) {
    #    [Console]::Out.Flush()
    Update-Scripts
} elseif ($isLinux) {
    
}
