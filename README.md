# About this
Dockerfile examples for Windows.


# for IIS server

## Included Remote Management
[see](https://technet.microsoft.com/ja-jp/library/dn198619.aspx?f=255&MSPPError=-2147217396)

## Included Web Deploy
Starting MsDepSvc.

## Included Remote Debugger.
* 規定のポート4020を使うのでポートフォワードが必要
* 現状はサービスによる起動方法がわからないので、インストールだけしておいて起動は以下のコマンドをコンテナ内部で実行することでデバッグ可能。

```cmd
cd "C:\Program Files\Microsoft Visual Studio 14.0\Common7\IDE\Remote Debugger\x64"
.\msvsmon.exe /nostatus /silent /nosecuritywarn /nofirewallwarn /noclrwarn
```

## How to docker run
```cmd
docker run -d --name [ContainerName] -p 81:80 -p 40201:4020 [ContainerImage]
```

# for Jenkins server

## Buildable enviroment is...
* AspNetCore on .NET Framework4.6.1



# Memo
* Create user command

```cmd
net user /add someuser *******
net localgroup administrators someuser /add
```
