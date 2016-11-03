FROM microsoft/windowsservercore

# Setup jre-8u91
RUN powershell -NoProfile -Command \
    wget -Uri 'http://javadl.oracle.com/webapps/download/AutoDL?BundleId=210185' -Outfile 'C:\jreinstaller.exe' ; \
    Start-Process -filepath C:\jreinstaller.exe -passthru -wait -argumentlist "/s,INSTALLDIR=C:\Java\jre1.8.0_91" ; \
    del C:\jreinstaller.exe;
ENV JAVA_HOME C:\\Java\\jre1.8.0_91
RUN setx PATH %PATH%;%JAVA_HOME%\bin

# Setup jenkins2.0
ENV HOME C:\Jenkins
ENV JENKINS_VERSION 2.0
RUN mkdir C:\Jenkins
RUN powershell -NoProfile -Command \
    wget -Uri 'https://updates.jenkins-ci.org/download/war/2.0/jenkins.war' -UseBasicParsing -OutFile 'C:\jenkins\jenkins.war';

# Setup git2.10.1
ENV chocolateyUseWindowsCompression false
RUN powershell -NoProfile -Command \
    iex ((new-object net.webclient).DownloadString('https://chocolatey.org/install.ps1')); \
    choco install -y git

# Setup MsBuild on net461
RUN powershell -NoProfile -Command \
    mkdir C:\Setup; \
    wget http://go.microsoft.com/fwlink/?LinkId=671743 -OutFile C:\Setup\NDP461-KB3102436-x86-x64-AllOS-ENU.exe; \
    wget https://download.microsoft.com/download/5/9/2/592E5924-46DA-462E-B0E1-28F02B1343CD/NDP461-DevPack-KB3105179-ENU.exe -OutFile C:\Setup\NDP461-DevPack-KB3105179-ENU.exe; \
    wget https://download.microsoft.com/download/E/E/D/EEDF18A8-4AED-4CE0-BEBE-70A83094FC5A/BuildTools_Full.exe -OutFile C:\Setup\BuildTools_Full.exe; \
    wget https://download.microsoft.com/download/0/D/5/0D50B63D-EE55-4834-8312-89CDEFABDE44/WebDeploy_amd64_ja-JP.msi -OutFile C:\Setup\WebDeploy_amd64_ja-JP.msi; \
    wget https://dist.nuget.org/win-x86-commandline/latest/nuget.exe -OutFile C:\Setup\nuget.exe;
RUN C:\Setup\NDP461-KB3102436-x86-x64-AllOS-ENU.exe /q /norestart /log C:\Setup\NDP461-KB3102436-x86-x64-AllOS-ENU_log.txt
RUN C:\Setup\NDP461-DevPack-KB3105179-ENU.exe /q /norestart /log C:\Setup\NDP461-DevPack-KB3105179-ENU_log.txt
RUN C:\Setup\BuildTools_Full.exe /silent /full /log C:\Setup\net_log.txt
RUN C:\Setup\nuget.exe Install MSBuild.Microsoft.VisualStudio.Web.targets -version 14.0.0.3 -outputdirectory C:\Setup
RUN msiexec /i C:\Setup\WebDeploy_amd64_ja-JP.msi AGREETOLICENSE=yes ADDLOCAL=ALL /qn
RUN mkdir "C:\Program Files (x86)\MSBuild\Microsoft\VisualStudio\v14.0"
RUN move "C:\Setup\MSBuild.Microsoft.VisualStudio.Web.targets.14.0.0.3\tools\VSToolsPath\Web" "C:\Program Files (x86)\MSBuild\Microsoft\VisualStudio\v14.0"
RUN move "C:\Setup\MSBuild.Microsoft.VisualStudio.Web.targets.14.0.0.3\tools\VSToolsPath\WebApplications" "C:\Program Files (x86)\MSBuild\Microsoft\VisualStudio\v14.0"

EXPOSE 8080
CMD ["/Java/jre1.8.0_91/bin/java.exe", "-jar", "/Jenkins/jenkins.war"]
