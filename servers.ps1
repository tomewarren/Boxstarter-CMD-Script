#====================================================
# Setting up a new machine using BoxStarter
# 1.Install Windows
# 2.Login.
# 3.Open an [ADMIN] command prompt and enter the following:
# START http://boxstarter.org/package/nr/url?https://raw.githubusercontent.com/tomewarren/Boxstarter-CMD-Script/master/servers.ps1

#==================================================== 
# Boxstarter options
$Boxstarter.RebootOk=$true # Allow reboots?
$Boxstarter.AutoLogin=$true # Save my password securely and auto-login after a reboot


#====================================================
# Programs and Tools
cinst -y toolsroot
cinst -y PowerShell
cinst -y 7zip.install
cinst -y googlechrome
cinst -y filezilla
cinst -y lockhunter
cinst -y sysinternals
cinst -y putty.install
cinst -y notepadplusplus.install
cinst -y win-no-annoy
cinst -y chocolatey
cinst -y DotNet4.5.1
cinst -y treesizefree
cinst -y ubuntu.font

#====================================================
# File Associations
Install-ChocolateyFileAssociation ".txt" "${env:ProgramFiles(x86)}\Notepad++\Notepad++.exe"
Install-ChocolateyFileAssociation ".xml" "${env:ProgramFiles(x86)}\Notepad++\Notepad++.exe"
Install-ChocolateyFileAssociation ".nuspec" "${env:ProgramFiles(x86)}\Notepad++\Notepad++.exe"
Install-ChocolateyFileAssociation ".config" "${env:ProgramFiles(x86)}\Notepad++\Notepad++.exe"


#====================================================
# Explorer options
Update-ExecutionPolicy RemoteSigned -Force
Set-ExplorerOptions -showHidenFilesFoldersDrives -showFileExtensions
Enable-RemoteDesktop
Disable-InternetExplorerESC

# Update Windows and reboot if necessary
Install-WindowsUpdate -AcceptEula

# Show more info for files in Explorer
Set-WindowsExplorerOptions -EnableShowFileExtensions -EnableShowFullPathInTitleBar


if (Test-PendingReboot) { Invoke-Reboot }
