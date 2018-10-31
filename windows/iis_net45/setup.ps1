mkdir C:\IIS\FailedReqLogFiles;
mkdir C:\IIS\IISLogFiles;
mkdir C:\IIS\wwwroot;

New-WebAppPool -Name default;
New-WebSite -Name default -PhysicalPath C:\IIS\wwwroot -Port 80 -ApplicationPool default;

$webSite = Get-Item IIS:\Sites\default;
$webSite.logFile.period = "Hourly";
$webSite.logFile.directory = "C:\IIS\IISLogFiles";
$webSite | Set-Item;
