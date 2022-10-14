# requirements for arch
# packages: acpi_call
# commands: modprobe acpi_call

switch ($args[0]){
  "sav1" {
    echo '\_SB.PCI0.LPC0.EC0.VPC0.SBMC 0x03' > /proc/acpi/call
  }
  "sav0" {
    echo '\_SB.PCI0.LPC0.EC0.VPC0.SBMC 0x05' > /proc/acpi/call
  }
  "savs" {
    echo '\_SB.PCI0.LPC0.EC0.BTSM' > /proc/acpi/call 
    cat /proc/acpi/call; printf '\n'
  }
  "qc1" {
    sh | echo "echo '\_SB.PCI0.LPC0.EC0.VPC0.SBMC 0x07' > /proc/acpi/call > /dev/null"
  }
  "qc0" {
    sh | echo "echo '\_SB.PCI0.LPC0.EC0.VPC0.SBMC 0x08' > /proc/acpi/call > /dev/null"
  }
  "qcs" {
    sh | echo "echo '\_SB.PCI0.LPC0.EC0.QCHO' > /proc/acpi/call > /dev/null "
    cat /proc/acpi/call; printf '\n'
  }
  default {
    Write-Output @"
###############################################################################
#                                                                             *
#                         Ideapad Gaming 3 utility for arch                   *
#                                                                             *
###############################################################################

USAGE:
  idapad.lua [COMMAND]

COMMAND:
  sav1   enable battery saving (battery limit around 55%)
  sav0   disable battery saving
  savs   show battery saving status (0 disabled, 1 enabled)
  qc1    enable quick charge
  qc0    disable quick charge
  qcs    show quick chage status (0 disabled, 1 enabled)

REQUIREMENTS:
  package acpi_call must be installed and the module must be enabled with
  modprobe acpi_call
"@
  }
}
