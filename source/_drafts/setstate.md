---
title: setState
tags: react
---

## 异步的 setState

目前，`setState` 在事件处理函数中是异步的，主要是为了确保一个事件使得父组件和子组件都调用 `setState` 的时候，子组件不会重新渲染两次。`setState` 会在事件完结之前对在这个事件过程中调用的 `setState` 进行批量处理。这能够提高大型应用的性能。

## setState 异步的原因

一次操作有可能调用多次的 setState，没必要每次 `setState` 都重新渲染，因为即便每次都渲染，用户都看不到中间的效果。从而提升性能。

下面的内容翻译自 [why is `setState` asynchronous?](https://github.com/facebook/react/issues/11527#issuecomment-360199710)，这个是 Dan 对这个问题做出的解释，我觉得没有什么比 React 的核心开发者作出的解释更权威了。

以下是翻译内容:

首先，我想我们都同意

## setState 过程

每个组件实例都有 `renderComponent` 方法，这个方法可以理解为是继承自 `React.Component` 的方法。在执行 `renderComponent` 时会重新执行实例的 `render` 方法。`render` 方法会返回新的 Virtual Node，随后执行 `patch(preVrtualNode, newVirtualNode)`

## 参考资料

- [setState](https://reactjs.org/docs/react-component.html#setstate)
- [When is setState asynchronous?](https://reactjs.org/docs/faq-state.html#when-is-setstate-asynchronous)
- [Why doesn’t React update this.state synchronously?](https://reactjs.org/docs/faq-state.html#when-is-setstate-asynchronous)
- [why is `setState` asynchronous?](https://github.com/facebook/react/issues/11527#issuecomment-360199710)
