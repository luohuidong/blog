---
title: JSX
tags:
- react
- jsx
---

JSX 与 Vue 中的模板非常类似，你可以将 JSX 理解为 React 中的模板。

JSX 现在已经成为一种独立的标准，虽然是 React 引入的，但现在已经不是 React 独有的，其他项目也可以使用。

## JSX 解析

JSX 是 `React.createElement(component, props, ...children)` 的语法糖。在开发环境中会将 JSX 编译成 JS 代码。由于不是 JS 代码，其实也会增加 debug 的成本。

JSX 代码：

```html
<MyButton color="blue" shadowSize={2}>
  Click Me
</MyButton>
```

会被转化为下面的 JS 代码：

```js
React.createElement(
  MyButton,
  {color: 'blue', shadowSize: 2},
  'Click Me'
)
```

`createElement` 这个函数与 virtual DOM 中的 `h` 函数、Vue 中的 `_c` 函数很类似，都是返回 Virtual Node。

## JSX 和 Virtual DOM 的关系

- Virtual DOM 是 React 初次推广开来的，结合了 JSX。
- JSX 就是模板，最终要渲染成 HTML。
- 初次渲染 + 修改 state 后的 re-render
- 正好复合 Virtual DOM 的应用场景

为何需要 Virtual DOM

## 参考资料

- [JSX In Depth](https://reactjs.org/docs/jsx-in-depth.html)
- [React Without JSX](https://reactjs.org/docs/react-without-jsx.html)
- [createElement()](https://reactjs.org/docs/react-api.html#createelement)
