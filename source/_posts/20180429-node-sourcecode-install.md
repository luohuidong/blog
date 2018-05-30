---
title: 通过源码安装 node
tags: node
date: 2018-04-29 13:19:53
---


## node 源码获取

首先先获取源码的链接

可以通过 [node官网](https://nodejs.org/en/)，或者 [淘宝NPM](https://npm.taobao.org/)获取。

下面通过源码链接来获取 `node 10.0.0` 的源码压缩文件。

```bash
wget https://npm.taobao.org/mirrors/node/latest/node-v10.0.0.tar.gz
```

## node 编译安装

通过源码链接获取的源码是一个压缩文件，此时需要运行下面命令来解压获取源码文件。

```bash
tar zxvf node-v10.0.0.tar.gz
```

解压完毕之后，会在当前文件夹中出现一个 `node-v10.0.0` 的文件夹，进入这个文件夹之后，在命令行中输入 `make` 进行编译，待编译完成之后，在命令行中输入 `sudo make install` 进行安装。

## node 卸载

如果想卸载 node 的话，则可以进入 node 源码的解压文件，输入 `sudo make uninstall` 即可。