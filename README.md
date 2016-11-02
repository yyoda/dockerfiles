# About this
Dockerfile examples for Windows.


# for IIS server

## Included IIS Remote Management & Web Deploy
必要に応じて任意のユーザを作成しておくとよい。

[IIS Remote Management](https://technet.microsoft.com/ja-jp/library/dn198619.aspx?f=255&MSPPError=-2147217396)

```cmd
net user /add someuser *******
net localgroup administrators develop /add
```



## Included Remote Debugger.
現状はサービスによる起動方法がわからないので、インストールだけしておいて起動は以下のコマンドをコンテナ内部で実行することでデバッグ可能。

```cmd
cd "C:\Program Files\Microsoft Visual Studio 14.0\Common7\IDE\Remote Debugger\x64"
.\msvsmon.exe /nostatus /silent /nosecuritywarn /nofirewallwarn /noclrwarn
```



# for Jenkins server

## Buildable enviroment is...
* AspNetCore on .NET Framework4.6.1

