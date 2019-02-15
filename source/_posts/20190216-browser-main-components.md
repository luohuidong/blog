---
title: 浏览器工作原理之主要组件 (Browser's main components)
tags: frontend
date: 2019-02-16 00:12:10
---


这篇文章为 [How Browsers Work: Behind the scenes of modern web browsers](https://www.html5rocks.com/en/tutorials/internals/howbrowserswork/) 关于 browser's heigh level structure 部分的笔记。

浏览器的主要组件有 7 个：

1. The user interface：包含地址栏，前进/后退按钮，书签栏等等。浏览器中除了展示请求页面的地方，都可以算得上是 user interface。
1. The browser engine：作用就是在 UI 和 rendering engine 之间传送指令。
1. The rendering engine：用于呈现请求的内容。例如，如果请求的内容是 HTML，则会解析 HTML 和 CSS，并将解析后的内容呈现在屏幕上。
1. Networking：用于调用网络，如 HTTP 请求
1. UI backend：用来绘制基本的部件，如 combo boxes 和 windows。
1. JavaScript interpreter：用于解析和执行 JS 代码。
1. Data storage：这是一个持久层。浏览器需要在本地保存各种的数据，例如 cookies。浏览器还支持 localStorage, indexedDB, WebSQL 和 FileSystem 存储机制。

![browser component](/images/browser-components.png)

需要注意的是 Chrome 每一个 tab 都是一个 rendering engine 的实例，每一个 tab 都是一个独立的进程。
