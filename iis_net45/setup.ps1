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
# net user /add develop somepwd
# net localgroup administrators develop /add
