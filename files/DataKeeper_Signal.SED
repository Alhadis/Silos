[Version]
Class=IEXPRESS
SEDVersion=3
[Options]
PackagePurpose=InstallApp
ShowInstallProgramWindow=0
HideExtractAnimation=0
UseLongFileName=1
InsideCompressed=0
CAB_FixedSize=0
CAB_ResvCodeSigning=0
RebootMode=N
InstallPrompt=%InstallPrompt%
DisplayLicense=%DisplayLicense%
FinishMessage=%FinishMessage%
TargetName=%TargetName%
FriendlyName=%FriendlyName%
AppLaunched=%AppLaunched%
PostInstallCmd=%PostInstallCmd%
AdminQuietInstCmd=%AdminQuietInstCmd%
UserQuietInstCmd=%UserQuietInstCmd%
SourceFiles=SourceFiles
[Strings]
InstallPrompt=DataKeeper_Signal requires PowerShell version 5.1 or newer. Do you wish to continue with the installation?
DisplayLicense=
FinishMessage=Installation complete. Check Task Scheduler and verify that the DataKeeper_Signal task has been created.
TargetName=<repopath>\DataKeeper_Signal.exe
FriendlyName=DataKeeper_Signal
AppLaunched=PowerShell -Command "$p='C:\Program Files (x86)\SIOS';if(Test-Path $env:ExtMirrBase){$p=$env:ExtMirrBase+'\..\'}else{mkdir $p}$p+='\DataKeeper_Signal';Expand-Archive DataKeeper_Signal.zip $p;cd $p;.\Install-DataKeeperSignal"
PostInstallCmd=<None>
AdminQuietInstCmd=
UserQuietInstCmd=
FILE0="DataKeeper_Signal.zip"
[SourceFiles]
SourceFiles0=<repopath>\
[SourceFiles0]
%FILE0%=
