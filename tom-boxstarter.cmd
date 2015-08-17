#====================================================
# Setting up a new machine using BoxStarter
# 1.Install Windows
# 2.Login.
# 3.Open a command prompt and enter the following:
# START http://boxstarter.org/package/nr/url?https://raw.githubusercontent.com/tomewarren/Boxstarter-CMD-Script/master/tom-boxstarter.cmd
#===================================================
#==================================================== 
# Boxstarter options
$Boxstarter.RebootOk=$true # Allow reboots?
$Boxstarter.AutoLogin=$false # Save my password securely and auto-login after a reboot


# Update Windows and reboot if necessary
Install-WindowsUpdate -AcceptEula
if (Test-PendingReboot) { Invoke-Reboot }

# Show more info for files in Explorer
Set-WindowsExplorerOptions -EnableShowFileExtensions -EnableShowFullPathInTitleBar

# Default to the desktop rather than application launcher
Set-StartScreenOptions -EnableBootToDesktop -EnableDesktopBackgroundOnStart -EnableShowStartOnActiveScreen -EnableShowAppsViewOnStartScreen -EnableSearchEverywhereInAppsView -EnableListDesktopAppsFirst



#====================================================
# Basic Setup
Update-ExecutionPolicy Unrestricted -Force
Set-ExplorerOptions -showHidenFilesFoldersDrives -showFileExtensions
Enable-RemoteDesktop
Disable-InternetExplorerESC


#====================================================
# Power Configuration
powercfg -x -standby-timeout-ac 30
#powercfg -x -standby-timeout-dc 0
powercfg -x -monitor-timeout-ac 20
#powercfg -x -monitor-timeout-dc 10
#powercfg -x -hibernate-timeout-ac 0
#powercfg -x -hibernate-timeout-dc 0
powercfg -x -disk-timeout-ac 10
#powercfg -x -disk-timeout-dc 20

#====================================================
# Programs and Tools
cinst -y PowerShell
#cinst -y 7zip.commandline
cinst -y 7zip.install
cinst -y teamviewer
cinst -y googlechrome
# cinst -y filezilla
# cinst -y Gow
# cinst -y lockhunter
cinst -y sysinternals
#cinst -y putty.install
cinst -y kitty.portable
cinst -y notepadplusplus.install
# cinst -y ConsoleZ.WithPin
#cinst -y paint.net
#cinst -y vlc
#cinst -y cccp
cinst -y dropbox
#cinst -y evernote
#cinst -y greenshot -Version 1.1.9.13
#cinst -y IcoFx
cinst -y imgburn
cinst -y javaruntime
#cinst -y markdownpad2
#cinst -y sumatrapdf.install
#cinst -y skype
#cinst -y truecrypt
cinst -y windirstat
cinst -y CCleaner
#cinst -y CutePDF
cinst -y Silverlight
cinst -y win-no-annoy

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
#cinst -y android-sdk
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
Install-ChocolateyPinnedTaskBarItem "$($Boxstarter.programFiles86)\Microsoft Visual Studio 12.0\Common7\IDE\devenv.exe"
Install-ChocolateyPinnedTaskBarItem "$($Boxstarter.programFiles86)\Evernote\Evernote\evernote.exe"
Install-ChocolateyPinnedTaskBarItem "$($Boxstarter.programFiles86)\Notepad++\Notepad++.exe"

#====================================================
# Install Visual Studio Extensions
# Install-ChocolateyVsixPackage add-empty-file https://visualstudiogallery.msdn.microsoft.com/3f820e99-6c0d-41db-aa74-a18d9623b1f3/file/140782/6/AddAnyFile.vsix
# Install-ChocolateyVsixPackage boost-test-adapter https://visualstudiogallery.msdn.microsoft.com/5f4ae1bd-b769-410e-8238-fb30beda987f/file/105652/19/BoostUnitTestAdapter.vsix
# Install-ChocolateyVsixPackage web-essentials https://visualstudiogallery.msdn.microsoft.com/6ed4c78f-a23e-49ad-b5fd-369af0c2107f/file/50769/32/WebEssentials.vsix
# Install-ChocolateyVsixPackage chutzpah https://visualstudiogallery.msdn.microsoft.com/f8741f04-bae4-4900-81c7-7c9bfb9ed1fe/file/66979/28/Chutzpah.VS2012.vsix
# Install-ChocolateyVsixPackage editor-config https://visualstudiogallery.msdn.microsoft.com/c8bccfe2-650c-4b42-bc5c-845e21f96328/file/75539/12/EditorConfigPlugin.vsix
# Install-ChocolateyVsixPackage file-nesting https://visualstudiogallery.msdn.microsoft.com/3ebde8fb-26d8-4374-a0eb-1e4e2665070c/file/123284/11/FileNesting.vsix
# Install-ChocolateyVsixPackage grunt-launcher https://visualstudiogallery.msdn.microsoft.com/dcbc5325-79ef-4b72-960e-0a51ee33a0ff/file/109075/17/GruntLauncher.vsix
# Install-ChocolateyVsixPackage multi-editing https://visualstudiogallery.msdn.microsoft.com/2beb9705-b568-45d1-8550-751e181e3aef/file/93630/8/MultiEdit.vsix
# Install-ChocolateyVsixPackage nunit-test-adapter https://visualstudiogallery.msdn.microsoft.com/6ab922d0-21c0-4f06-ab5f-4ecd1fe7175d/file/66177/15/NUnitVisualStudioTestAdapter-1.2.vsix
# Install-ChocolateyVsixPackage package-intellisense https://visualstudiogallery.msdn.microsoft.com/65748cdb-4087-497e-a394-2e3449c8e61e/file/138140/11/JSON%20Intellisense.vsix
# Install-ChocolateyVsixPackage side-waffle https://visualstudiogallery.msdn.microsoft.com/a16c2d07-b2e1-4a25-87d9-194f04e7a698/referral/110630
# Install-ChocolateyVsixPackage fsharp-power-tools https://visualstudiogallery.msdn.microsoft.com/136b942e-9f2c-4c0b-8bac-86d774189cff/file/124201/24/FSharpVSPowerTools.vsix

#====================================================
# Windows Features
# cinst -y Microsoft-Hyper-V-All -source windowsFeatures
# cinst -y IIS-WebServerRole -source windowsfeatures

#====================================================

if (Test-PendingReboot) { Invoke-Reboot }