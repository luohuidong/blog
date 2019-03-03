---
title: CSRF (跨站请求伪造)
tags:
- frontend
- 网络安全
---

CSRF (Cross Site Request Forgy)，原理就是攻击者构造出一个后端请求地址，诱导用户点击或者通过某些途径自动发起请求。如果用户是在登录状态下的话，后端就以为是用户在操作，从而进行相应的逻辑。

CSRF 中的跨站与 XSS 中的跨站含义不相同。CSRF 中的跨站指的是其它网站对本网站的影响，而 XSS 中的跨站指的是非本网站的脚本对本站的影响。

如果某个网站是通过 GET 请求修改数据库数据，则可以利用 img 标签进行 CSRF 攻击。

```html
<img src="http://www.domain.com/xxx?comment='attack'"/>
```
 
如果是 POST 的提交方式，则可以诱导某个用户进入某个页面，在页面中通过提交表单提交 POST 请求。

## CSRF 防御

1. Get 请求不对数据进行修改
