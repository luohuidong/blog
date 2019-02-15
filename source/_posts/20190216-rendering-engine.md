---
title: 浏览器工作原理之渲染引擎 (rendering engines)
tags: frontend
date: 2019-02-16 04:08:01
---


这篇文章为 [How Browsers Work: Behind the scenes of modern web browsers](https://www.html5rocks.com/en/tutorials/internals/howbrowserswork/) 关于 rendering engines 部分的笔记。

![rendering-engines](/images/rendering-engines.png)

Rendering engines 即为浏览器渲染引擎。它的主要作用就是将请求回来的内容展示在浏览器上。

不同的浏览器使用不同的 rendering engine，如 Firefox 使用的是 Gecko，Safari 使用的是 WebKit，Chrome 和 Opera 使用 Blink（这是一个 WebKit 的分支）

## 渲染过程

以 WebKit rendering engine 为例对渲染过程进行说明：

1. Rendering engine 会解析 HTML 文档，生成 DOM tree。同时 rendering engine 会解析外部 CSS 文件或样式元素上的样式数据并生成 style rules。

1. 随后会通过 DOM tree 以及 style rules 去构造 render tree。

1. 当 render tree 构建完之后，将会有一个 layout 的过程。这个过程为每个节点分配一个在屏幕上显示的确切坐标。

1. layout 之后将进入 painting 阶段，这个阶段 render tree 会被遍历，每一个节点都通过 UI backend 层进行绘制。

渲染过程是一个渐进的过程。为了更好的用户体验，rendering engine 会尽快显示内容在屏幕上。因此它会不等到所有的 HTML 都解析完毕之后，才去构建和 layout render tree。而是将一部分的内容先进行解析呈现，同时又对不断接收的余下内容进行处理。

## 渲染流程图

通过下面两幅图，将会对渲染过程有更为直观的感受。

WebKit rendering engine 渲染流程图：

![webkit-rendering-engine-main-flow](/images/webkit-rendering-engine-main-flow.png)

Gecko rendering engine 渲染流程图：

![gecko-rendering-engine-main-flow](/images/gecko-rendering-engine-main-flow.jpg)

尽管 WebKit 与 Gecko 所使用的术语不同，但是其渲染过程基本上是一样的。

## 参考资料

- [How Browsers Work: Behind the scenes of modern web browsers](https://www.html5rocks.com/en/tutorials/internals/howbrowserswork/#The_rendering_engine)
- [浏览器的渲染原理简介](https://coolshell.cn/articles/9666.html)