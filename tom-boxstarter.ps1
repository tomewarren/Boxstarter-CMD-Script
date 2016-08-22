#====================================================
# Setting up a new machine using BoxStarter
# 1.Install Windows
# 2.Login.
# 3.Open an [ADMIN] command prompt and enter the following:
# START http://boxstarter.org/package/nr/url?https://raw.githubusercontent.com/tomewarren/Boxstarter-CMD-Script/master/tom-boxstarter.ps1
#===================================================
#==================================================== 
# Boxstarter options
$Boxstarter.RebootOk=$true # Allow reboots?
$Boxstarter.AutoLogin=$true # Save my password securely and auto-login after a reboot


#====================================================
# Basic Setup
Update-ExecutionPolicy Unrestricted -Force
Set-ExplorerOptions -showHidenFilesFoldersDrives -showFileExtensions
Enable-RemoteDesktop
Disable-InternetExplorerESC


#====================================================
# Power Configuration
#powercfg -x -standby-timeout-ac 30
#powercfg -x -standby-timeout-dc 0
powercfg -x -monitor-timeout-ac 20
#powercfg -x -monitor-timeout-dc 10
#powercfg -x -hibernate-timeout-ac 0
#powercfg -x -hibernate-timeout-dc 0
#powercfg -x -disk-timeout-ac 10
#powercfg -x -disk-timeout-dc 20
#====================================================
# Programs and Tools
cinst -y PowerShell
#cinst -y terminals
#cinst -y 7zip.commandline
cinst -y 7zip.install
cinst -y teamviewer
#cinst -y googlechrome
#cinst -y filezilla
# cinst -y Gow
#cinst -y lockhunter
cinst -y sysinternals
#cinst -y putty.install
#cinst -y kitty.portable
cinst -y notepadplusplus.install
# cinst -y ConsoleZ.WithPin
#cinst -y paint.net
cinst -y vlc
#cinst -y cccp
cinst -y dropbox
#cinst -y evernote
cinst -y greenshot -Version 1.1.9.13
#cinst -y IcoFx
#cinst -y imgburn
cinst -y javaruntime
#cinst -y markdownpad2
#cinst -y sumatrapdf.install
#cinst -y skype
#cinst -y truecrypt
cinst -y windirstat
#cinst -y CCleaner
#cinst -y CutePDF
#cinst -y Silverlight
cinst -y win-no-annoy
cinst -y chocolatey
cinst -y 7zip.commandline
cinst -y 7zip.install
cinst -y autohotkey.portable
cinst -y chocolatey
cinst -y ChocolateyGUI
cinst -y ConEmu
cinst -y DotNet4.5
cinst -y DotNet4.5.1
cinst -y dropbox
cinst -y EthanBrown.ConEmuConfig
cinst -y Evernote
cinst -y Everything
cinst -y f.lux
cinst -y flashplayerplugin
cinst -y git
cinst -y git.install
cinst -y gitextensions
cinst -y GoogleChrome
cinst -y jbs
cinst -y kitty
cinst -y lastpass
cinst -y lastpass-for-applications
cinst -y multimonitortool
cinst -y PowerShell
cinst -y qbittorrent
cinst -y rufus
cinst -y rufus.install
cinst -y SourceCodePro
cinst -y teamviewer
cinst -y toolsroot
cinst -y totalcommander
cinst -y treesizefree
cinst -y ubuntu.font
cinst -y VisualStudioCode
cinst -y windirstat
cinst -y Xming



#====================================================
# Source Control
# cinst -y git.install
# cinst -y poshgit
#cinst -y SourceTree

#====================================================
# .NET Development
# cinst -y VisualStudioCommunity2013
# cinst -y VS2013.4
# cinst -y VS2013.VSCommands
# cinst -y visualstudio2013-sdk
# cinst -y cloc
# cinst -y expresso
# cinst -y nunit
# cinst -y xunit
# cinst -y dotpeek
# cinst -y resharper
# cinst -y WinMerge
# cinst -y cmake
# cinst -y tfs2013powertools

#====================================================
# Web Development
#cinst -y nodejs.install
#cinst -y Yeoman
#cinst -y fiddler4

#====================================================
# Android Development
#cinst -y java.jdk
#cinst -y AndroidStudio
cinst -y android-sdk
#cinst -y xamarin-studio

#====================================================
# Python
#cinst -y python
#cinst -y python2

#====================================================
# Ruby
# cinst -y ruby
# cinst -y ruby.devkit
# cinst -y Compass
# cinst -y sass

#====================================================
# File Associations
Install-ChocolateyFileAssociation ".txt" "${env:ProgramFiles(x86)}\Notepad++\Notepad++.exe"
Install-ChocolateyFileAssociation ".xml" "${env:ProgramFiles(x86)}\Notepad++\Notepad++.exe"
Install-ChocolateyFileAssociation ".nuspec" "${env:ProgramFiles(x86)}\Notepad++\Notepad++.exe"
Install-ChocolateyFileAssociation ".config" "${env:ProgramFiles(x86)}\Notepad++\Notepad++.exe"

#====================================================
# Pin to the taskbar
Install-ChocolateyPinnedTaskBarItem "$($Boxstarter.programFiles)\Google\Chrome\Application\chrome.exe"
Install-ChocolateyPinnedTaskBarItem "$($Boxstarter.programFiles86)\Evernote\Evernote\evernote.exe"
Install-ChocolateyPinnedTaskBarItem "$($Boxstarter.programFiles86)\Notepad++\Notepad++.exe"

#====================================================
# Windows Features
cinst -y Microsoft-Hyper-V-All -source windowsFeatures
# cinst -y IIS-WebServerRole -source windowsfeatures

#====================================================


# Update Windows and reboot if necessary
Install-WindowsUpdate -AcceptEula

# Show more info for files in Explorer
Set-WindowsExplorerOptions -EnableShowFileExtensions -EnableShowFullPathInTitleBar

# Default to the desktop rather than application launcher
Set-StartScreenOptions -EnableBootToDesktop -EnableDesktopBackgroundOnStart -EnableShowStartOnActiveScreen -EnableShowAppsViewOnStartScreen -EnableSearchEverywhereInAppsView -EnableListDesktopAppsFirst




if (Test-PendingReboot) { Invoke-Reboot }
