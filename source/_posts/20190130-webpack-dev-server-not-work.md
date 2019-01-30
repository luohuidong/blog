---
title: webpack-dev-server 在 Ubuntu 18.04 中不起作用
tags:
  - webpack
  - ubuntu
date: 2019-01-30 10:00:01
---


在发现 webpack-dev-server 不生效的同时，还有一个有趣的现象，就是打开 vs code 就会弹出一个提示，`"Visual Studio Code is unable to watch for file changes in this large workspace" (error ENOSPC)` 。于是我按照 vs code [官网提示](https://code.visualstudio.com/docs/setup/linux#_visual-studio-code-is-unable-to-watch-for-file-changes-in-this-large-workspace-error-enospc)，在 `/etc/sysctl.conf` 最后添加了 `fs.inotify.max_user_watches=524288` 随后执行 `sudo sysctl -p`。

在重启完 vs code 以及项目之后，发现除了 vs code 不再弹出提示之外，连 webpack-dev-server 也能热更新了。也就是说，之前　vs code 以及 webpack-dev-server 监控失败，都与 `fs.inotify.max_user_watches` 过小有关。

在 github 上，由两个 issue，都提到了同样的问题，并给出解决方案。

- [webpack --watch fails silently when fs.inotify.max_user_watches is exceeded](https://github.com/webpack/webpack/issues/1281)
- [Silent fail when fs.inotify.max_user_watches is exceeded](https://github.com/webpack/watchpack/issues/46)

监控文件失败的其主要原因是，Linux 中是通过 inotify API 来对文件进行实时监控。因此，如果超出起设定的监控文件数量，则监控文件会失效。这也就是为什么 vs code 官网中提示将 `fs.inotify.max_user_watches` 设置到 524288 的原因。

参考文档：

- ["Visual Studio Code is unable to watch for file changes in this large workspace" (error ENOSPC)](https://code.visualstudio.com/docs/setup/linux#_visual-studio-code-is-unable-to-watch-for-file-changes-in-this-large-workspace-error-enospc)
- [Linux real-time file watching errors](https://support.code42.com/CrashPlan/4/Troubleshooting/Linux_Real-Time_File_Watching_Errors)
- [webpack --watch fails silently when fs.inotify.max_user_watches is exceeded](https://github.com/webpack/webpack/issues/1281)
- [Silent fail when fs.inotify.max_user_watches is exceeded](https://github.com/webpack/watchpack/issues/46)
