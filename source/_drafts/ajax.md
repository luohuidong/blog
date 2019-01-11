---
title: JS-了解 Ajax
tags: javascript
---

Ajax 是 Axynchronous Javascript + XML 的缩写，是一种能够向服务器请求额外的数据而无须卸载页面从而能带来更好用户体验的技术，其核心是 XMLHttpRequest 对象。

```js
function get() {
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

```
