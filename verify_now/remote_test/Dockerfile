FROM microsoft/windowsservercore

RUN net user /add someuser password
RUN net localgroup administrators someuser /add

RUN powershell -NoProfile -command Enable-PSRemoting -force

CMD ["powershell"]
