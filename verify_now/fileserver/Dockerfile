FROM microsoft/windowsservercore

RUN net user /add develop password
RUN net localgroup administrators develop /add

RUN powershell -NoProfile -Command \
    Add-WindowsFeature FS-FileServer; \
    Enable-PSRemoting;

CMD ["powershell"]
