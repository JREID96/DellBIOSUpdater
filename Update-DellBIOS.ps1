<# 
Dell BIOS Updater v2.1.2
Automatically updates the BIOS of Dell machines. Files are pulled from \\fileserver\UserShares\Dept-IT\ServiceCatalog-Technical\_Drivers-Firmware\Dell\DellBIOSUpdater\
You can use the DellBIOSUpdater.exe utility to upload updated Dell BIOS executables (Found inside the same directory)
Jarred Reid 2019

Changelog: 

2.1.2 - Further code consolidation
2.1.1 - Moved logic from multiple "if" statements over to a single switch parameter and added support for Dell Optiplex 3070
2.0 - Added support for Optiplex 7060s
1.9 - Fixed a bug where the script would not run if "newbios.exe" was present in C:\Temp\
1.8 - Added support for Precision 5820 Tower
1.7 - Added support for Optiplex 3060s 
#>

Clear-Host

### Grabs the computer model from WMI
$Model = Get-WmiObject -class Win32_ComputerSystem | select Model -expand model 

### Tests to see if C:\Temp exists. If not, then the script will create it.
$path = "C:\Temp"
if(!(Test-Path $path))
{
    New-Item -ItemType Directory -Force -Path $path
}

$bios = "C:\Temp\newbios.exe"
if(Test-Path $bios)
{
    Remove-Item $bios
}

switch ($model) {
    "Optiplex 3020" {
        $fw = "3020"
    }

    "Optiplex 3040" {
        $fw = "3040"
    }

    "Optiplex 3050" {
        $fw = "3050"
    }

    "Optiplex 3060" {
        $fw = "3060"
    }

    "Optiplex 3070" {
        $fw = "3070"
    }

    "Optiplex 7050" {
        $fw = "7050"
    }

    "Optiplex 7060" {
        $fw = "7060"
    }

    "Precision 5820 Tower" {
        $fw = "5820"
    }
}

Copy "\\fileserver\UserShares\Dept-IT\ServiceCatalog-Technical\_Drivers-Firmware\Dell\DellBIOSUpdater\newbios$fw.exe" -Destination "C:\Temp\"
Rename-Item -Path "C:\Temp\newbios$fw.exe" -NewName "newbios.exe"

### Suspends Bitlocker on the drive, and will re-encrypt after 1 reboot.
Suspend-BitLocker -MountPoint C: -RebootCount 1 

### Silently starts the BIOS update, and gives the machine the 1 reboot it needs to re-encrypt the drive.
C:\Temp\newbios.exe /s /r /p=BIOSdome480
