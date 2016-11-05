FROM microsoft/windowsservercore

ARG pj="default"

RUN echo $pj
RUN echo ${pj}
RUN mkdir C:\a$pj
RUN mkdir C:\a${pj}

CMD ["powershell.exe", "ls"]
