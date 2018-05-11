# START http://boxstarter.org/package/nr/url?https://raw.githubusercontent.com/tomewarren/Boxstarter-CMD-Script/master/default-install.ps1

# Boxstarter options
Write-Host "Boxstarter Options"
$Boxstarter.RebootOk=$true # Allow reboots?
$Boxstarter.AutoLogin=$true # Save my password securely and auto-login after a reboot


#--- Configuration ---
Write-Host "Config"
$gaming = $True
$computername = "tom-desktop-home"

#---- TEMPORARY ---
Disable-UAC

#--- Fonts ---
Write-Host "Fonts"
choco install inconsolata -y
choco install -y Chocolatey 
cinst -y boxstarter

  
#--- Windows Settings ---
Write-Host "Win Settings"
Disable-BingSearch
Disable-GameBarTips

Set-WindowsExplorerOptions -EnableShowHiddenFilesFoldersDrives -EnableShowProtectedOSFiles -EnableShowFileExtensions -EnableShowFullPathInTitleBar -EnableOpenFileExplorerToQuickAccess -EnableShowRecentFilesInQuickAccess -EnableShowFrequentFoldersInQuickAccess -EnableExpandToOpenFolder
Set-TaskbarOptions -Size Large -Dock Bottom -Combine Always -AlwaysShowIconsOn -Lock
Update-ExecutionPolicy Unrestricted -Force
Enable-RemoteDesktop
Disable-InternetExplorerESC


#--- Windows Subsystems/Features ---
#Write-Host "linux?"
#choco install Microsoft-Hyper-V-All -source windowsFeatures -y
#choco install Microsoft-Windows-Subsystem-Linux -source windowsfeatures -y
#
#--- Install Ubuntu in WSL
#lxrun /install /y

Write-Host "tools!"
#--- Tools ---
choco install sysinternals -y
cinst -y VisualStudioCode
cinst -y git
cinst -y vscode-powershell
cinst -y vscode-tslint
cinst -y ditto
cinst -y keypirinha
cinst -y keepass

Write-Host "apps"
#--- Apps ---
cinst -y powershell
choco install googlechrome -y
choco install firefox -y
#choco install docker-for-windows -y
choco install notepadplusplus -y
cinst -y windirstat
choco install cmder -y
cinst -y chocolatey
cinst -y ChocolateyGUI
cinst -y 7zip.install
cinst -y DotNet4.5
cinst -y DotNet4.5.1

If ($gaming -eq $True) {
    choco install steam -y
    choco install obs-studio -y
    choco install discord -y
}

Write-Host "files!"
#--- Notepad++ file Association ---
Install-ChocolateyFileAssociation ".txt" "${env:ProgramFiles(x86)}\Notepad++\Notepad++.exe"
Install-ChocolateyFileAssociation ".xml" "${env:ProgramFiles(x86)}\Notepad++\Notepad++.exe"
Install-ChocolateyFileAssociation ".nuspec" "${env:ProgramFiles(x86)}\Notepad++\Notepad++.exe"
Install-ChocolateyFileAssociation ".config" "${env:ProgramFiles(x86)}\Notepad++\Notepad++.exe"
Install-ChocolateyFileAssociation ".ps1" "${env:ProgramFiles(x86)}\Notepad++\Notepad++.exe"
Install-ChocolateyFileAssociation ".bat" "${env:ProgramFiles(x86)}\Notepad++\Notepad++.exe"
Install-ChocolateyFileAssociation ".sh" "${env:ProgramFiles(x86)}\Notepad++\Notepad++.exe"
Install-ChocolateyFileAssociation ".log" "${env:ProgramFiles(x86)}\Notepad++\Notepad++.exe"
Install-ChocolateyFileAssociation ".bash" "${env:ProgramFiles(x86)}\Notepad++\Notepad++.exe"
Install-ChocolateyFileAssociation ".html" "${env:ProgramFiles(x86)}\Notepad++\Notepad++.exe"
Install-ChocolateyFileAssociation ".py" "${env:ProgramFiles(x86)}\Notepad++\Notepad++.exe"

#--- Uninstall unecessary applications that come with Windows out of the box ---

Write-Host "Uninstall stuff"
# 3D Builder
Get-AppxPackage Microsoft.3DBuilder | Remove-AppxPackage

# Alarms
Get-AppxPackage Microsoft.WindowsAlarms | Remove-AppxPackage

# Autodesk
Get-AppxPackage *Autodesk* | Remove-AppxPackage

# Bing Weather, News, Sports, and Finance (Money):
Get-AppxPackage Microsoft.BingFinance | Remove-AppxPackage
Get-AppxPackage Microsoft.BingNews | Remove-AppxPackage
Get-AppxPackage Microsoft.BingSports | Remove-AppxPackage
Get-AppxPackage Microsoft.BingWeather | Remove-AppxPackage

# BubbleWitch
Get-AppxPackage *BubbleWitch* | Remove-AppxPackage

# Candy Crush
Get-AppxPackage king.com.CandyCrush* | Remove-AppxPackage

# Comms Phone
Get-AppxPackage Microsoft.CommsPhone | Remove-AppxPackage

# Dell
Get-AppxPackage *Dell* | Remove-AppxPackage

# Dropbox
Get-AppxPackage *Dropbox* | Remove-AppxPackage

# Facebook
Get-AppxPackage *Facebook* | Remove-AppxPackage

# Feedback Hub
Get-AppxPackage Microsoft.WindowsFeedbackHub | Remove-AppxPackage

# Get Started
Get-AppxPackage Microsoft.Getstarted | Remove-AppxPackage

# Keeper
Get-AppxPackage *Keeper* | Remove-AppxPackage

# Mail & Calendar
Get-AppxPackage microsoft.windowscommunicationsapps | Remove-AppxPackage

# Maps
Get-AppxPackage Microsoft.WindowsMaps | Remove-AppxPackage

# March of Empires
Get-AppxPackage *MarchofEmpires* | Remove-AppxPackage

# McAfee Security
Get-AppxPackage *McAfee* | Remove-AppxPackage

# Messaging
Get-AppxPackage Microsoft.Messaging | Remove-AppxPackage

# Minecraft
Get-AppxPackage *Minecraft* | Remove-AppxPackage

# Netflix
Get-AppxPackage *Netflix* | Remove-AppxPackage

# Office Hub
Get-AppxPackage Microsoft.MicrosoftOfficeHub | Remove-AppxPackage

# One Connect
Get-AppxPackage Microsoft.OneConnect | Remove-AppxPackage

# OneNote
Get-AppxPackage Microsoft.Office.OneNote | Remove-AppxPackage

# People
Get-AppxPackage Microsoft.People | Remove-AppxPackage

# Phone
Get-AppxPackage Microsoft.WindowsPhone | Remove-AppxPackage

# Photos
Get-AppxPackage Microsoft.Windows.Photos | Remove-AppxPackage

# Plex
Get-AppxPackage *Plex* | Remove-AppxPackage

# Skype (Metro version)
Get-AppxPackage Microsoft.SkypeApp | Remove-AppxPackage

# Sound Recorder
Get-AppxPackage Microsoft.WindowsSoundRecorder | Remove-AppxPackage

# Solitaire
Get-AppxPackage *Solitaire* | Remove-AppxPackage

# Sticky Notes
Get-AppxPackage Microsoft.MicrosoftStickyNotes | Remove-AppxPackage

# Sway
Get-AppxPackage Microsoft.Office.Sway | Remove-AppxPackage

# Twitter
Get-AppxPackage *Twitter* | Remove-AppxPackage

# Xbox
Get-AppxPackage Microsoft.XboxApp | Remove-AppxPackage
Get-AppxPackage Microsoft.XboxIdentityProvider | Remove-AppxPackage

# Zune Music, Movies & TV
Get-AppxPackage Microsoft.ZuneMusic | Remove-AppxPackage
Get-AppxPackage Microsoft.ZuneVideo | Remove-AppxPackage

Write-Host "more win stuff"
#--- Windows Settings ---
# Some from: @NickCraver's gist https://gist.github.com/NickCraver/7ebf9efbfd0c3eab72e9

# Privacy: Let apps use my advertising ID: Disable
If (-Not (Test-Path "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\AdvertisingInfo")) {
    New-Item -Path HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\AdvertisingInfo | Out-Null
}
Set-ItemProperty -Path HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\AdvertisingInfo -Name Enabled -Type DWord -Value 0

# WiFi Sense: HotSpot Sharing: Disable
If (-Not (Test-Path "HKLM:\Software\Microsoft\PolicyManager\default\WiFi\AllowWiFiHotSpotReporting")) {
    New-Item -Path HKLM:\Software\Microsoft\PolicyManager\default\WiFi\AllowWiFiHotSpotReporting | Out-Null
}
Set-ItemProperty -Path HKLM:\Software\Microsoft\PolicyManager\default\WiFi\AllowWiFiHotSpotReporting -Name value -Type DWord -Value 0

# WiFi Sense: Shared HotSpot Auto-Connect: Disable
Set-ItemProperty -Path HKLM:\Software\Microsoft\PolicyManager\default\WiFi\AllowAutoConnectToWiFiSenseHotspots -Name value -Type DWord -Value 0

# Start Menu: Disable Bing Search Results
Set-ItemProperty -Path HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Search -Name BingSearchEnabled -Type DWord -Value 0
# To Restore (Enabled):
# Set-ItemProperty -Path HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Search -Name BingSearchEnabled -Type DWord -Value 1

# Disable Telemetry (requires a reboot to take effect)
# Note this may break Insider builds for your organization
# Set-ItemProperty -Path HKLM:\SOFTWARE\Policies\Microsoft\Windows\DataCollection -Name AllowTelemetry -Type DWord -Value 0
# Get-Service DiagTrack,Dmwappushservice | Stop-Service | Set-Service -StartupType Disabled

# Change Explorer home screen back to "This PC"
Set-ItemProperty -Path HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced -Name LaunchTo -Type DWord -Value 1
# Change it back to "Quick Access" (Windows 10 default)
# Set-ItemProperty -Path HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced -Name LaunchTo -Type DWord -Value 2

# Better File Explorer
Set-ItemProperty -Path HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced -Name NavPaneExpandToCurrentFolder -Value 1		
Set-ItemProperty -Path HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced -Name NavPaneShowAllFolders -Value 1		
Set-ItemProperty -Path HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced -Name MMTaskbarMode -Value 2

# These make "Quick Access" behave much closer to the old "Favorites"
# Disable Quick Access: Recent Files
Set-ItemProperty -Path HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer -Name ShowRecent -Type DWord -Value 0
# Disable Quick Access: Frequent Folders
Set-ItemProperty -Path HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer -Name ShowFrequent -Type DWord -Value 0
# To Restore:
# Set-ItemProperty -Path HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer -Name ShowRecent -Type DWord -Value 1
# Set-ItemProperty -Path HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer -Name ShowFrequent -Type DWord -Value 1

# Disable the Lock Screen (the one before password prompt - to prevent dropping the first character)
If (-Not (Test-Path HKLM:\SOFTWARE\Policies\Microsoft\Windows\Personalization)) {
	New-Item -Path HKLM:\SOFTWARE\Policies\Microsoft\Windows -Name Personalization | Out-Null
}
Set-ItemProperty -Path HKLM:\SOFTWARE\Policies\Microsoft\Windows\Personalization -Name NoLockScreen -Type DWord -Value 1
# To Restore:
# Set-ItemProperty -Path HKLM:\SOFTWARE\Policies\Microsoft\Windows\Personalization -Name NoLockScreen -Type DWord -Value 1

# Lock screen (not sleep) on lid close
#Set-ItemProperty -Path 'HKLM:\SYSTEM\CurrentControlSet\Control\Session Manager\Power' -Name AwayModeEnabled -Type DWord -Value 1
# To Restore:
# Set-ItemProperty -Path 'HKLM:\SYSTEM\CurrentControlSet\Control\Session Manager\Power' -Name AwayModeEnabled -Type DWord -Value 0

# Use the Windows 7-8.1 Style Volume Mixer
If (-Not (Test-Path "HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\MTCUVC")) {
	New-Item -Path "HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion" -Name MTCUVC | Out-Null
}
Set-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\MTCUVC" -Name EnableMtcUvc -Type DWord -Value 0
# To Restore (Windows 10 Style Volume Control):
# Set-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\MTCUVC" -Name EnableMtcUvc -Type DWord -Value 1

# Disable Xbox Gamebar
Set-ItemProperty -Path "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\GameDVR" -Name AppCaptureEnabled -Type DWord -Value 0
Set-ItemProperty -Path "HKCU:\System\GameConfigStore" -Name GameDVR_Enabled -Type DWord -Value 0

# Turn off People in Taskbar
If (-Not (Test-Path "HKCU:SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced\People")) {
    New-Item -Path HKCU:SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced\People | Out-Null
}
Set-ItemProperty -Path "HKCU:SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced\People" -Name PeopleBand -Type DWord -Value 0

#--- Restore Temporary Settings ---
#Enable-UAC
Enable-MicrosoftUpdate
Install-WindowsUpdate -acceptEula

#--- Rename the Computer ---
# Requires restart, or add the -Restart flag
if ($env:computername -ne $computername) {
	Rename-Computer -NewName $computername
}

# Update Windows and reboot if necessary
Install-WindowsUpdate -AcceptEula

if (Test-PendingReboot) { Invoke-Reboot }

