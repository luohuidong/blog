---
title: JS-前端 HTTP 请求方式练级指南
tags: javascript
date: 2019-01-11 18:39:52
---

## 了解前端实现 HTTP 请求的几种方式

在开始深入了解前端 HTTP 请求之前，可以阅读下面的文章，这样可以对前端的 HTTP 请求的几种方式有初步的印象。

- [Here are the most popular ways to make an HTTP request in JavaScript](https://medium.freecodecamp.org/here-is-the-most-popular-ways-to-make-an-http-request-in-javascript-954ce8c95aaa)

## JSON 与 XML

在深入了解 HTTP 请求方式之前，先了解一下前后端数据交换的格式，JSON 与 XML。现在用的比较多的是 JSON。

- [MDN: JSON](https://developer.mozilla.org/zh-CN/docs/Web/JavaScript/Reference/Global_Objects/JSON)
- [w3schools: JSON](https://www.w3schools.com/js/js_json_intro.asp)
- [w3schools: XML Tutorial](https://www.w3schools.com/xml/default.asp)

## Ajax

初步了解：

- [freeCodeCamp: Introduction to the JSON APIs and AJAX Challenges](https://learn.freecodecamp.org/data-visualization/json-apis-and-ajax)
- [w3schools: AJAX](https://www.w3schools.com/js/js_ajax_intro.asp)
- [Ajax全接触](https://www.imooc.com/learn/250)：视频

深入了解 Ajax，可以看《JavaScript 高级程序设计》（第3版）第 21 章 Ajax 与 Coment 的内容以及 MDN 的文档。

- [JavaScript 高级程序设计](http://www.ituring.com.cn/book/946)：强烈推荐一定要看《JS 高程》，除了了解 Ajax 之外，还能顺便把跨域问题给了解了。
- [MDN: Ajax](https://developer.mozilla.org/zh-CN/docs/Web/Guide/AJAX)

Ajax 可以通过以下几种方式去实现：

- 浏览器 XMLHttpRequest 对象：[XMLHttpRequest](https://xhr.spec.whatwg.org/)
- 使用 XMLHttpRequest 对象去实现 Ajax 可能比较繁杂，则可以利用下面几种方式：
  - [jQuery.ajax](https://api.jquery.com/jQuery.ajax/)
  - [MDN: Fetch](https://developer.mozilla.org/zh-CN/docs/Web/API/Fetch_API/Using_Fetch)
  - [Axios](https://github.com/axios/axios)

## HTTP

- [MDN: HTTP](https://developer.mozilla.org/zh-CN/docs/Web/HTTP)
- 《图解 HTTP》

## 跨域问题

- 《JavaScript 高级程序设计》（第3版）第 21 章
- [MDN: CSP 策略指令](https://developer.mozilla.org/zh-CN/docs/Web/Security/CSP/CSP_policy_directives)
- [MDN: Same-origin policy](https://developer.mozilla.org/en-US/docs/Web/Security/Same-origin_policy)：浏览器同源策略
- [MDN: HTTP访问控制（CORS）](https://developer.mozilla.org/zh-CN/docs/Web/HTTP/Access_control_CORS#%E8%B0%81%E5%BA%94%E8%AF%A5%E8%AF%BB%E8%BF%99%E7%AF%87%E6%96%87%E7%AB%A0%EF%BC%9F)
- [ajax跨域完全讲解](https://www.imooc.com/learn/947)：视频
- [不要再问我跨域的问题了](https://segmentfault.com/a/1190000015597029)
