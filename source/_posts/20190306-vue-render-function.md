---
title: Vue 中如何解析模板
tags:
  - vue
  - mvvm
date: 2019-03-06 23:15:42
---


## 模板是什么

从 Vue 的官网复制的一个模板的例子：

```html
<ul id="example-1">
  <li v-for="item in items">
    {{ item.message }}
  </li>
</ul>
```

模板虽然与 HTML 长得很像，但是其本质就是字符串。所以模板与 HTML 是有很大区别的。

模板要显示在页面中，需要转换成 JS 代码，JS 代码表现为一个 render 函数。也就是说 Vue 会将模板的结构，通过一个 render 函数来表示。随后再转换为 HTML 渲染到页面。

至于模板在转换成 Html 之前需要先转换成 JS 的原因主要是模板里面有逻辑（如 v-if、v-for 等），在前端中 HTML、CSS、JS 这三者，能处理逻辑的就只有 JS 了。

## with 语句

在理解 render 函数之前，先了解一下 JS 中 `with` 的用法。需要注意的是，请不要在开发中使用 `with` 因为它有可能产生令人困惑的 Bug 和兼容性问题。

下面举例子说明一下 with 的作用。

```javascript
const obj = {
    name: 'allan',
}
function fn() {
    console.log(obj.name)
}
fn() // 'allan'
```

下面的代码实现与上面的代码相同的功能，其中 `fn` 中使用了 `with` ：

```javascript
const obj = {
    name: 'allan',
}
function fn() {
    with(obj) {
        console.log(name)
    }
}
fn() // 'allan'
```

由此可以看出 with 扩展了语句的作用域链。

## render 函数

前面提到了，模板中定义的内容，会转换成 JS 代码。通过一个 render 函数，表示模板中的结构。然后最后才转化为 HTML 在页面上显示。

举一个简单的 vue 例子：

```html
<div id="app">
  <p>{{price}}</p>
</div>

<script>
  const vm = new Vue({
    el: '#app',
    data: {
      price: 100
    }
  })
</script>
```

模板部分

```html
<div id="app">
  <p>{{price}}</p>
</div>
```

会被转换为

```js
render() {
  with(this) {
    return _c(
      'div',
      {
        attrs: {"id": "app"}
      },
      [
        _c('p', [_v(_s(price))])
      ]
    )
  }

}
```

render 函数中，this 即为 vue 实例。

## 生成 HTML

前面已经介绍了模板会先转换成一个 `render` 函数， 下面将了解一下 `render` 究竟是如何将内容转换为 HTML 的，这一部分会与 Virtural DOM 相关。

前面介绍 `render` 函数的时候，其中出现多次 `_c` 函数，这个函数非常类似于 Virtual DOM 中使用 `h` 函数生成节点。所以 `render` 函数返回的是一个 Virtual Node。

如果对 Virtual DOM 有点陌生的，可以查看一下 [snabbdom](https://github.com/snabbdom/snabbdom) 的介绍。这里简单介绍一下 snabbdom。snabbdom 是通过 `h` 函数生成 Virtual Node，然后利用 `patch` 函数将 Virtual Node 渲染到页面中。而且 `patch` 还可以对比 Virtual Node 的前后差异，并且只对有差异的地方进行 DOM 的更改。

`render` 函数返回的 Virtual Node 渲染到页面的过程与 snabbdom 将 Virtual Node 渲染到页面是非常类似的。

## 资料

- [Introduction to Vue.js Render Functions](https://alligator.io/vuejs/introduction-render-functions/)
