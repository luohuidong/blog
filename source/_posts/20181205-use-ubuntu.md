---
title: 为什么折腾 Ubuntu
date: 2018-12-05 10:18:29
tags: 日志
---

在 Windows 10 下用了很长一段时间的 Linux 子系统，装环境的时候比使用 Windows 8 的时候真的好太多了。要知道在没有 Linux 子系统的时候，要在 Windows 上面装环境真的是个灾难，就是 C++ 编译环境就够折腾了。

记得之前工作的时候，接口项目有一个 node package 需要 c++ 编译环境，运行项目的时候各种编译不通过的，拼命提示我要安装 c++ 编译环境，下了个 Visual Studio 很开心地将 C++ 编译相关的东西都装了一遍，一运行还是报错啊，别说程序崩溃了，我自己都崩溃了啊。最后还发现这个 package 还跟 node 版本相关，版本太新不行。之后各种找资料，将 Node 版本装回稳定版，还找到了一个叫 [Windows-Build-Tools](https://github.com/felixrieseberg/windows-build-tools) 的 node package，解决了 c++ 编译环境的问题。当最后项目跑起来的时候，真特么的有种被世界温柔相待的感受好吗，两行热泪都要留下来了。

有一段时间特别想折腾 Docker，但是由于开发移动端的时候，需要跑在 Genymotion 上，Genymotion 又依赖 Virtural Box。而 Docker 在 Windows 上运行依赖 Hyper-V。这就造成了当时只要 Docker 跟 Genymotion 一同时运行，电脑直接蓝屏，十分痛苦。为了不影响工作，只能是将 Docker 给卸载了。当然，后面在官网上看到 Docker Toolbox 能使 Docker 依赖于 Virtural Box，这个是后话了。

当然在 Windows 上装环境还有各种辛酸史，例如装 MySQL，还有 Python2 跟 Python3 不能同时存在等等，反正在 Windows 上开发肯定深有体会。

后来 Window 10 能使用 Linux 子系统的时候，装了一个 Ubuntu 子系统。啊，从此在装环境上面溜得不行，各种开发环境轻轻松松用命令行安装呀，安装过程不像 Windows 那样需要各种配置。装了 nvm 之后，随意切换任何版本的 node。python 2 和 python 3 随便使用。C++ 编译环境一条 `sudo apt install -y build-essential` 轻轻松松地搞掂。另外就是 Linux 的命令行真的真的很好用，这种命令行体验是在 Windows 上即使使用了 cmder 都无法媲美的。也正是有了这么好的安装开发环境体验，种草了 Ubuntu。

Win 10 有了 Linux 子系统之后，可以说在编程体验上提升了很多。但是 Linux 子系统仍然有些缺点，例如用 node 跑项目的时候，明显没有在 windows 环境下速度快。另外在 Windows 中没法使用 Linux 子系统中装好的环境，例如 Java, python 环境。开发 React Native 项目的时候，还是要在 Windows 中搭环境。而 React Native 项目依赖 python 2，在 vs code 写含有 python 3 新特性的代码，pylint 仍然会按照 python 2 的语法规则进行警告提示，看着很不爽。

既然种草了，那当然需要拔草，趁着辞职之后有时间折腾，果断上手体验一下 Ubuntu。作为一个小白，装显卡驱动真的是一件很头疼的事。为啥要折腾显卡驱动？之前开发一直是用双屏的，装完 Ubuntu 之后发现外接的显示器一直没图像。没法外接显示器，这怎么能忍啊，只能乖乖滚去装显卡驱动呀。反正我刚开始装显卡驱动的时候是各种折腾，系统都重装了好几次，折腾得都差点要装回 Windows 了。看在它能秒开 vs code, atom 的份上，我就忍忍。当然最后折腾了两天总算是把驱动给搞好了。顺手将解决步骤记了下来 [Ubuntu 18.04 显卡驱动安装](https://luohuidong.github.io/study-linux/docs/ubuntu/install-nvidia-drivers)。
