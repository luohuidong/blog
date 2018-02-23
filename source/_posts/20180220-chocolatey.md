---
title: chocolatey 常用命令
date: 2018-02-20 13:36:40
tags:
---

# 1. Chocolatey

## 1.1. Install Chocolatey

### 1.1.1. Install with cmd.exe

```
@"%SystemRoot%\System32\WindowsPowerShell\v1.0\powershell.exe" -NoProfile -InputFormat None -ExecutionPolicy Bypass -Command "iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))" && SET "PATH=%PATH%;%ALLUSERSPROFILE%\chocolatey\bin"
```

### 1.1.2. Install with PowerShell.exe

```
Set-ExecutionPolicy Bypass -Scope Process -Force; iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))
```

## 1.2. List Command

`choco list --local-only` 查看本地安装的软件

`choco list node` 搜索node相关的packages

## 1.3. Install Command

`choco install notepadplusplus googlechrome atom 7zip`

## 1.4. Outdated Command

Returns a list of outdated packages. `choco outdated`

## 1.5. Upgrade Command

`choco upgrade chocolatey`

## 1.6. Uninstall Command

`choco uninstall pkg`

## 1.7. 设置代理

`choco config set --name proxy --value '127.0.0.1'`