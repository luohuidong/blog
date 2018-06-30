---
title: Markdown语法-链接
date: 2018-06-30 10:52:29
tags: markdown
---

Markdown 链接语法有 **行内式** 与 **参考式** 这两种。

## 行内式

行内式语法，为方括号 `[]` 后紧跟圆括号 `()`。其中方括号中为 **链接显示文字**，圆括号中为 **链接地址**。

**代码：**

```markdown
[google](https://www.google.com/)
```

**效果：**

[google](https://www.google.com/)

链接除了指向网址外，还可以指向本地文件，代码如下：

**代码：**

```markdown
[webpack](./webpack.png)
```

在实际使用中，当点击了这个链接的时候，会直接转跳显示本地图片。

## 参考式

参考式相当于将行内式拆分成两部分。类似于把链接存放在一个变量中，然后在后文中重复使用。

**代码：**

```markdown
[link]: https://www.google.com/

[google][link]
[google webside][link]
```

**效果：**

[link]: https://www.google.com/

[google][link]

[google webside][link]

点击上面两个链接，都会打开 google 搜索页面。
