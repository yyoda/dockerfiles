mkdir C:\IIS\FailedReqLogFiles;
mkdir C:\IIS\IISLogFiles;
mkdir C:\IIS\wwwroot;

New-WebAppPool -Name default;
New-WebSite -Name default -PhysicalPath C:\IIS\wwwroot -Port 80 -ApplicationPool default;

$webSite = Get-Item IIS:\Sites\default;
$webSite.logFile.period = "Hourly";
$webSite.logFile.directory = "C:\IIS\IISLogFiles";
$webSite | Set-Item;

# Web発行などが必要な場合はユーザを作成しておく必要がある
# net user /add someuser *******
# net localgroup administrators develop /add

# リモートデバッガー起動方法
#cd "C:\Program Files\Microsoft Visual Studio 14.0\Common7\IDE\Remote Debugger\x64"
#.\msvsmon.exe /nostatus /silent /nosecuritywarn /nofirewallwarn /noclrwarn
