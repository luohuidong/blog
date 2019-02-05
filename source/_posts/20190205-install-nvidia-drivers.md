---
title: Ubuntu 18.04 显卡驱动安装
tags:
  - linux
  - ubuntu
date: 2019-02-05 22:19:33
---


系统：Ubuntu 18.04

## 准备

如果之前已经安装过显卡驱动，请参照“显卡驱动卸载”部分的内容执行卸载操作。

## 安装

### 通过 PPA 安装
1. 进入 BIOS 中将 secure boot 设置为 disable。

1. 进入 Ubuntu，打开终端，添加 ppa:graphics-drivers/ppa repository。

    ```bash
    $ sudo add-apt-repository ppa:graphics-drivers/ppa
    $ sudo apt update
    ```

1. 自动安装合适的显卡驱动。

    ```bash
    sudo ubuntu-drivers autoinstall
    ```

1. 重启系统。

通过 PPA 安装有个问题，就是只要经过 Software Updater 更新 software 之后，显卡驱动就会出现问题。猜测应该是跟 Linux 内核更新有关。猜测的主要依据为 [Install NVIDIA Driver and CUDA](https://gist.github.com/wangruohui/df039f0dc434d6486f5d4d098aa52d07) 这篇文章中提到，通过 apt-get 的方式去安装驱动，每次 Linux 内核更新的时候，NVIDIA 驱动都需要重新安装。

## 显卡驱动卸载

### 卸载通过 PPA 方式安装的显卡驱动

如果之前曾通过 PPA 安装过 Nvidia 的显卡驱动请进行下面的步骤：

1. 清除与 NVIDIA 相关的应用。

    ```bash
    sudo apt purge nvidia*
    # some interactive operations
    sudo apt autoremove
    # some interactive operations
    ```

1. 检查其余与 NVIDIA 相关的 packages。

    ```bash
    dpkg -l | grep nvidia
    ```

    如果这些 packages 存在，则手动删除。

    ```bash
    sudo dpkg -P <package_name>
    ```

1. 重启

    ```bash
    reboot
    ```

## 卸载通过手动方式安装的显卡驱动

执行之前手动安装显卡的官方 `.run` 文件，并添加 `--uninstall` 参数

```bash
sudo ./XXX.run --uninstall
```

参考资料：

- [Install NVIDIA Driver and CUDA](https://gist.github.com/wangruohui/df039f0dc434d6486f5d4d098aa52d07)
- [Intel for display, NVIDIA for computing](https://gist.github.com/wangruohui/bc7b9f424e3d5deb0c0b8bba990b1bc5)
- [How to install the NVIDIA drivers on Ubuntu 18.04 Bionic Beaver Linux](https://linuxconfig.org/how-to-install-the-nvidia-drivers-on-ubuntu-18-04-bionic-beaver-linux)
- [ubuntu18.04进行Nvidia显卡配置](https://blog.csdn.net/qq_37935670/article/details/80377196)
