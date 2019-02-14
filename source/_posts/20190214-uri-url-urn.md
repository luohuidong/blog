---
title: URI URL URN 的关系
tags: http
date: 2019-02-14 20:17:59
---


要说明 URI、URL、URN 的关系，则首先需要知道这三个东西究竟是什么。

- URI：

  A URI (Uniform Resource Identifier) is a string that refers to a resource.

  URI 是指向资源的标识，通过这个标识你能找到这个资源。

- URL：

  Uniform Resource Locator (URL) is a text  string specifying where a resource can be found on the Internet.

  In the context of HTTP, URLs are called "Web address" or "link". Your browser displays URLs in its address bar, for example `https://developer.mozilla.org`.

  URLs can also be used for file transfer (FTP) , emails (SMTP), and other applications.

  URL 就是我们在浏览器输入的网址。它跟 URI 一样，也是字符串，它告诉我们要选找的资源在哪里。

- URN:

  URN (Uniform Resource Name) is a URI in a standard format, referring to a resource without specifying its location or whether it exists.

  URN 是 URI 的一种标准格式，与 URL 相反，URN 虽然也是指向资源，但是并没有说明资源的位置以及这个资源是否存在。

根据 [URIs, URLs, and URNs: Clarifications and Recommendations 1.0](https://www.w3.org/TR/uri-clarification/) Contemporary View 小节中对 URL 的说明：

> a URL is a type of URI that identifies a resource via a representation of its primary access mechanism (e.g., its network "location"), rather than by some other attributes it may have.

因此知道 URL 是 URI 的一种类型，通俗点来说就是 URI 是 URL 的爸爸。

从上面的信息可以看出，URI 包含，URL 与 URN。而 URL 跟 URN 是并列关系。

## 参考资料

- [URI](https://developer.mozilla.org/en-US/docs/Glossary/URI)
- [URL](https://developer.mozilla.org/en-US/docs/Glossary/URL)
- [URN](https://developer.mozilla.org/en-US/docs/Glossary/URN)
- [URIs, URLs, and URNs: Clarifications and Recommendations 1.0](https://www.w3.org/TR/uri-clarification/)
