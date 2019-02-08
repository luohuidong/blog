---
title: 什么是 virtual dom
tags: javascript
---

## 什么是 virtual dom

所谓的 virtual dom，指的是用 JavaScript 来模拟 DOM 结构，将 DOM 变化的对比操作放在 JS 层来做。

## 为什么使用 virtual

1. DOM 操作是非常耗费浏览器性能的，项目越复杂，影响越明显。

1. 默认创建的 DOM 节点是一个属性非常多的节点，可以通过 `for...in` 可以获取所有的 DOM 节点属性。从侧面可以看出 DOM 操作的复杂性。因此减少 DOM 的操作，能够获得高的性能。

1. 与 DOM 操作相比，浏览器运行 Js 的效率是非常高的。因此利用 JS 来模拟 DOM 结构，将 DOM 结构的变化对比操作放在 JS 层，只重回变更的节点，从而提高重绘性能。

## virtual dom 主要解决了什么问题

## github

- [virtual-dom](https://github.com/Matt-Esch/virtual-dom)
- [snabbdom](https://github.com/snabbdom/snabbdom)

## 参考资料

- [Why is React's concept of Virtual DOM said to be more performant than dirty model checking?](https://stackoverflow.com/questions/21109361/why-is-reacts-concept-of-virtual-dom-said-to-be-more-performant-than-dirty-mode)
- [React’s diff algorithm](https://calendar.perfplanet.com/2013/diff/)
- [React: The Virtual DOM](https://www.codecademy.com/articles/react-virtual-dom)
- [Virtual DOM and diffing algorithm](https://gist.github.com/Raynos/8414846)
- [React’s diff algorithm](https://calendar.perfplanet.com/2013/diff/)
- [The Inner Workings Of Virtual DOM](https://medium.com/@rajaraodv/the-inner-workings-of-virtual-dom-666ee7ad47cf)
- [The difference between Virtual DOM and DOM](https://reactkungfu.com/2015/10/the-difference-between-virtual-dom-and-dom/)
- [The Real Benefits of the Virtual DOM in React.js](https://www.accelebrate.com/blog/the-real-benefits-of-the-virtual-dom-in-react-js/)
