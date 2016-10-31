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

EXPOSE 8080
CMD ["/Java/jre1.8.0_91/bin/java.exe", "-jar", "/Jenkins/jenkins.war"]
