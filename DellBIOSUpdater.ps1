### Dell BIOS Updater v2.0
### Automatically updates the BIOS of Dell machines. Files are pulled from \\fileserver\UserShares\Dept-IT\ServiceCatalog-Technical\_Drivers-Firmware\Dell\DellBIOSUpdater\
### You can use the DellBIOSUpdater.exe utility to upload updated Dell BIOS executables (Found inside the same directory)
### Jarred Reid 2019

### Changelog: 

### 2.0 - Added support for Optiplex 7060s
### 1.9 - Fixed a bug where the script would not run if "newbios.exe" was present in C:\Temp\
### 1.8 - Added support for Precision 5820 Tower
### 1.7 - Added support for Optiplex 3060s

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

### Downloads the correct firmware based on the $Model variable, then renames it to "newbios.exe"
if ($Model -eq "Optiplex 3060"){
    Copy "\\fileserver\UserShares\Dept-IT\ServiceCatalog-Technical\_Drivers-Firmware\Dell\DellBIOSUpdater\newbios3060.exe" -Destination "C:\Temp\"
    Rename-Item -Path "C:\Temp\newbios3060.exe" -NewName "newbios.exe"
}

if ($Model -eq "OptiPlex 3050"){
    Copy "\\fileserver\UserShares\Dept-IT\ServiceCatalog-Technical\_Drivers-Firmware\Dell\DellBIOSUpdater\newbios3050.exe" -Destination "C:\Temp\"
    Rename-Item -Path "C:\Temp\newbios3050.exe" -NewName "newbios.exe"
}

if ($Model -eq "OptiPlex 3040"){
    Copy "\\fileserver\UserShares\Dept-IT\ServiceCatalog-Technical\_Drivers-Firmware\Dell\DellBIOSUpdater\newbios3040.exe" -Destination "C:\Temp\" 
    Rename-Item -Path "C:\Temp\newbios3040.exe" -NewName "newbios.exe"
}

if ($Model -eq "OptiPlex 3020"){
    Copy "\\fileserver\UserShares\Dept-IT\ServiceCatalog-Technical\_Drivers-Firmware\Dell\DellBIOSUpdater\newbios3020.exe" -Destination "C:\Temp\" 
    Rename-Item -Path "C:\Temp\newbios3020.exe" -NewName "newbios.exe"
}

if ($Model -eq "OptiPlex 7050"){
    Copy "\\fileserver\UserShares\Dept-IT\ServiceCatalog-Technical\_Drivers-Firmware\Dell\DellBIOSUpdater\newbios7050.exe" -Destination "C:\Temp\" 
    Rename-Item -Path "C:\Temp\newbios7050.exe" -NewName "newbios.exe"
}

if ($Model -eq "OptiPlex 7060"){
    Copy "\\fileserver\UserShares\Dept-IT\ServiceCatalog-Technical\_Drivers-Firmware\Dell\DellBIOSUpdater\newbios7060.exe" -Destination "C:\Temp\" 
    Rename-Item -Path "C:\Temp\newbios7060.exe" -NewName "newbios.exe"
}

if ($Model -eq "Precision 5820 Tower"){
    Copy "\\fileserver\UserShares\Dept-IT\ServiceCatalog-Technical\_Drivers-Firmware\Dell\DellBIOSUpdater\newbios5820.exe" -Destination "C:\Temp\" 
    Rename-Item -Path "C:\Temp\newbios5820.exe" -NewName "newbios.exe"
}

### Suspends Bitlocker on the drive, and will re-encrypt after 1 reboot.
Suspend-BitLocker -MountPoint C: -RebootCount 1 

### Silently starts the BIOS update, and gives the machine the 1 reboot it needs to re-encrypt the drive.
C:\Temp\newbios.exe /s /r /p=BIOSdome480
