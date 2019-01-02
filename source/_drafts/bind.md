---
title: JS-函数多次使用 bind 它的 this 会是什么？
tags: javascript
---

通过一个列子，来说明一下。

```js
const objA = {
    name: '小明'
}

const objB = {
    name: '小红'
}

function sayName () {
    console.log(`My name is ${this.name}.`)
}

sayName.bind(objA).bind(objB)() // My name is 小明.
```

为什么输出的不是小红而是小明？

先看一下 `sayName.bind(objA).bind(objB)` 究竟是什么意思。

```js
sayName.bind(objA).bind(objB)

// 等价于

function sayName () {
    console.log(`My name is ${this.name}.`)
}.bind(objA).bind(objB)

// 等价于
function sayName () {
    console.log(`My name is ${objA.name}.`)
}.bind(objB)
```

可以看到 `sayName` 中的 `this` 是由第一次的 `bind` 决定的，后面即使再次 `bind` 也不会改变 `this` 的指向。

