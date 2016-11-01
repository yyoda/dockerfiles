FROM microsoft/iis

# Setup IIS
RUN powershell -NoProfile -Command \
    Import-Module ServerManager; \
    Add-WindowsFeature Web-Mgmt-Service; \
    Set-ItemProperty -Path HKLM:\SOFTWARE\Microsoft\WebManagement\Server -Name EnableRemoteManagement -V 1; \
    Set-Service -name WMSVC -StartupType Automatic; \
    Start-service WMSVC; \
    Add-WindowsFeature NET-Framework-45-ASPNET; \
    Add-WindowsFeature Web-Asp-Net45; \
    Import-module WebAdministration; \
    Stop-WebAppPool -Name DefaultAppPool; \
    Remove-WebSite 'Default Web Site'; \
    Remove-WebAppPool DefaultAppPool; \
    Remove-WebAppPool '.NET v4.5'; \
    Remove-WebAppPool '.NET v4.5 Classic';

# Create temporary space
RUN mkdir C:\Setup

# Setup Web Deploy3.6
RUN powershell wget https://download.microsoft.com/download/0/D/5/0D50B63D-EE55-4834-8312-89CDEFABDE44/WebDeploy_amd64_ja-JP.msi -OutFile C:\Setup\WebDeploy_amd64_ja-JP.msi
RUN msiexec /i C:\Setup\WebDeploy_amd64_ja-JP.msi AGREETOLICENSE=yes ADDLOCAL=ALL /qn
RUN powershell Start-service MsDepSvc;

# Setup own
ADD setup.ps1 C:\\Setup
RUN powershell -NoProfile -Command C:\Setup\setup.ps1
