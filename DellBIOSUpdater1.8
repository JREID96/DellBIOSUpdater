### Dell BIOS Updater v1.8
### Automatically updates the BIOS of Dell machines. Files are pulled from \\fileserver\Dell\DellBIOSUpdater\
### You can use the DellBIOSUpdater.exe utility to upload updated BIOS packages inside the same directory. 
### Jarred Reid 2019

### Changelog: 
### 1.8 - Added support for Precision 5820 Tower
### 1.7 - Added support for Optiplex 3060s

clear

### Grabs the computer model from WMI
$Model = Get-WmiObject -class Win32_ComputerSystem | select Model -expand model 

### Tests to see if C:\Temp exists. If not, then the script will create it.
$path = "C:\Temp"
if(!(Test-Path $path))
{
New-Item -ItemType Directory -Force -Path $path
}

### Downloads the correct firmware based on the $Model variable, then renames it to "newbios.exe"
if ($Model -eq "Optiplex 3060"){
Copy "\\fileserver\Dell\DellBIOSUpdater\newbios3060.exe" -Destination "C:\Temp\"
Rename-Item -Path "C:\Temp\newbios3060.exe" -NewName "newbios.exe"
}

if ($Model -eq "OptiPlex 3050"){
Copy "\\fileserver\Dell\DellBIOSUpdater\newbios3050.exe" -Destination "C:\Temp\"
Rename-Item -Path "C:\Temp\newbios3050.exe" -NewName "newbios.exe"
}

if ($Model -eq "OptiPlex 3040"){
Copy "\\fileserver\Dell\DellBIOSUpdater\newbios3040.exe" -Destination "C:\Temp\" 
Rename-Item -Path "C:\Temp\newbios3040.exe" -NewName "newbios.exe"
}

if ($Model -eq "OptiPlex 3020"){
Copy "\\fileserver\Dell\DellBIOSUpdater\\newbios3020.exe" -Destination "C:\Temp\" 
Rename-Item -Path "C:\Temp\newbios3020.exe" -NewName "newbios.exe"
}

if ($Model -eq "OptiPlex 7050"){
Copy "\\fileserver\Dell\DellBIOSUpdater\newbios7050.exe" -Destination "C:\Temp\" 
Rename-Item -Path "C:\Temp\newbios7050.exe" -NewName "newbios.exe"
}

if ($Model -eq "Precision 5820 Tower"){
    Copy "\\fileserver\Dell\DellBIOSUpdater\\newbios5820.exe" -Destination "C:\Temp\" 
    Rename-Item -Path "C:\Temp\newbios5820.exe" -NewName "newbios.exe"
    }

### Suspends Bitlocker on the drive, and will re-encrypt after 1 reboot.
Suspend-BitLocker -MountPoint C: -RebootCount 1 

### Silently starts the BIOS update, and gives the machine the 1 reboot it needs to re-encrypt the drive.
C:\Temp\newbios.exe /s /r /p=Password123
