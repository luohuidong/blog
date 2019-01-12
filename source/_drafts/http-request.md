---
title: JS-HTTP 请求方式
tags: javascript
---

这篇文章使用 [JSONPlaceholder](https://jsonplaceholder.typicode.com/) 提供的 REST API。

## Ajax

Ajax 是 Asynchronous JavaScript And XML 的缩写，这种技术结合了两样东西：

- 浏览器内置的 XMLHttpRequest 对象
- DOM

通过 XMLHttpRequest 对象向服务器发送请求并将获取到的数据通过操作 DOM 渲染到页面上，从而达到在向服务器请求数据后无须重新加载页面的效果。

下面的例子是利用 XHR (XMLHttpRequest) 对象向服务器发送 GET 请求获取数据的最基本例子。

```js
function get(url) {
  const req = new XMLHttpRequest()
  req.onreadystatechange = function () {
    if (req.readyState == 4) {
      if (req.status == 200) {
        console.log(req.responseText);
      }
    }
  }
  req.open("GET", url, true)
  req.send(null)
}

get('https://jsonplaceholder.typicode.com/todos/1')
```

上面的例子可以看出，利用 XHR 对象发送最基本请求其实就是四个步骤：

1. 使用 `new XMLHttpRequest()` 创建一个 XHR 对象。

1. 给 XHR 对象绑定事件处理函数。

1. 使用 `open()` 方法启动一个请求以备发送。

    `open()` 接受 3 个参数：要发送的请求的类型、请求的 URL以及是否异步发送请求的布尔值。

1. 使用 `send()` 方法发送请求。

    `send()` 方法接受一个参数，即作为请求主体发送数据。如果不需要通过请求主体发送数据，则不传。

### XHR 对象属性

当收到服务器响应之后，响应数据会自动填充 XHR 对象的属性：

- responseText：作为响应主体被返回的文本。
- responseXML：如果响应的内容类型是 `text/xml` 或 `application/xml` ，这个属性中将保存包含着响应数据的 XHR DOM 文档。
- status：响应的 HTTP 状态。一般来说，可以将 HTTP 状态代码为 200 作为成功的标志。

在异步请求中，readyState 表示请求/响应过程的当前活动阶段。一般我们只关注 `readyState` 值为 4 这个阶段的数据。因为这个阶段已经接收到全部响应数据，而且已经可以在客户端使用了。

### HTTP 头部信息

设置发送请求的自定义头部，可以使用 `setRequestHeader()`，这个方法接受两个参数：头部字段的名称和头部字段的值。这个方法必须在 `open()` 方法之后，`send()` 方法之前调用。

通过 XHR 对象的 `getResponseHeader()` 方法并传入头部字段名称，可以取得相应的响应头部信息。调用 `getAllResponseHeaders()` 可以取得一个包含所有头部信息的长字符串。

### POST 请求

