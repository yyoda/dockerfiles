mkdir C:\IIS\FailedReqLogFiles;
mkdir C:\IIS\IISLogFiles;
mkdir C:\IIS\wwwroot;

New-WebAppPool -Name example;
New-WebSite -Name example -PhysicalPath C:\IIS\wwwroot -Port 80 -ApplicationPool example;

$webSite = Get-Item IIS:\Sites\example;
$webSite.logFile.period = "Hourly";
$webSite.logFile.directory = "C:\IIS\IISLogFiles";
$webSite | Set-Item;
