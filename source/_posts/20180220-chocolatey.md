---
title: chocolatey 常用命令
date: 2018-02-20 13:36:40
tags: tool
---

# Chocolatey

## Install Chocolatey

### Install with cmd.exe

```
@"%SystemRoot%\System32\WindowsPowerShell\v1.0\powershell.exe" -NoProfile -InputFormat None -ExecutionPolicy Bypass -Command "iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))" && SET "PATH=%PATH%;%ALLUSERSPROFILE%\chocolatey\bin"
```

### Install with PowerShell.exe

```
Set-ExecutionPolicy Bypass -Scope Process -Force; iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))
```

## List Command

`choco list --local-only` 查看本地安装的软件

`choco list node` 搜索node相关的packages

## Install Command

`choco install notepadplusplus googlechrome atom 7zip`

## Outdated Command

Returns a list of outdated packages. `choco outdated`

## Upgrade Command

`choco upgrade chocolatey`

## Uninstall Command

`choco uninstall pkg`

## 设置代理

`choco config set --name proxy --value '127.0.0.1'`