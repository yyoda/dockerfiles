FROM microsoft/windowsservercore

RUN net user /add develop password
RUN net localgroup administrators develop /add

RUN powershell -NoProfile -command Enable-PSRemoting -force

CMD ["powershell"]
