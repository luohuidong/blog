---
title: HTML 解析器
tags: frontend
---

HTML 解析器的工作就是将 HTML markup 解析成 parse tree。

## HTML 不是 context free grammar

关于为什么 HTML 不是 context free grammar，可以看一下 stackoverflow 的一个提问。

- [Is HTML a context-free language?](https://stackoverflow.com/questions/5175840/is-html-a-context-free-language)

有一种正式的格式去定义 HTML，DTD (Document Type Definition).

由于 HTML 的宽容性，

## HTML DTD

HTML 定义采用 DTD (Document Type Definition) 格式。这种格式定义了所有允许的元素、元素属性、以及元素层级结构。

DTD 有一些变体。一种是严格模式，这种模式会严格遵循规范。而另一种是其它模式，在其它模式中会包含旧浏览器支持的标签。这样做的目的是兼容以前老的内容。

## DOM

HTML 经过解析生成的 Parse tree 就是我们熟知的 DOM tree， 由 DOM 元素以及属性节点构成。DOM 是 Document Object Model 的缩写。DOM 描述了 HTML 文档，同时是 HTML 元素的对外接口。DOM tree 的根为 Document 对象。

DOM 中含有与标签一一对应的关系，如：

```html
<html>
  <body>
    <p>
      Hello World
    </p>
    <div> <img src="example.png"/></div>
  </body>
</html>
```

上面的标签会生成下面的 DOM tree：

![image](https://user-images.githubusercontent.com/26449894/52930000-aabfb900-3381-11e9-92d1-dfc20e7c67f0.png)

## 解析算法

算法由两个阶段：tokenization 和树的构建。Tokenization 的过程为词法分析过程，将输入的内容转化为 tokens。

HTML 中的 tokens：

- start tags
- end tags
- attribute names
- attribute values

Tokenizer 能识别 token，并将 token 放置在树的结构当中。并通过下一个字符识别出下一个 token，直到处理完所有输入的内容。

下图为 HTML 的解析流程图：

![image](https://user-images.githubusercontent.com/26449894/52930987-9d0c3280-3385-11e9-9d33-ef0a13455a18.png)

## Tokenization 算法

Tokenization 算法的输出结果是 HTML token。算法使用状态机来表示。每一个状态接收一个或多个字符，并且根据这些字符更新下一个状态。这个状态的变化，由当前 tokenization 状态和树结构状态决定。这意味着即使是相同的字符，由于当前状态的不同，而使下一个状态产生不同的结果。
