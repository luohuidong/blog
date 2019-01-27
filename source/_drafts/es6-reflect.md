---
title: ES6 Reflect 要点
tags:
- javascript
- es6
---

`Reflect` 对象与 `Proxy` 对象一样，也是 ES6 为了操作对象而提供的新 API。

`Reflect` 对象的设计目的有这样几个。

- 将 `Object` 对象的一些明显属于语言内部的方法（比如 `Object.defineProperty`），放到 `Reflect` 对象上。现阶段，某些方法同时在 `Object` 和 `Reflect` 对象上部署，未来的新方法将只部署在 `Reflect` 对象上。也就是说，从Reflect对象上可以拿到语言内部的方法。

- 修改某些 `Object` 方法的返回结果，让其变得更合理。比如，`Object.defineProperty(obj, name, desc)` 在无法定义属性时，会抛出一个错误，而 `Reflect.defineProperty(obj, name, desc)` 则会返回 `false`。

- 让 `Object` 操作都变成函数行为。某些 `Object` 操作是命令式，比如 `name in obj` 和 `delete obj[name]`，而 `Reflect.has(obj, name)` 和 `Reflect.deleteProperty(obj, name)` 让它们变成了函数行为。

- `Reflect` 对象的方法与 `Proxy` 对象的方法一一对应，只要是 `Proxy` 对象的方法，就能在 `Reflect` 对象上找到对应的方法。这就让 `Proxy` 对象可以方便地调用对应的 `Reflect` 方法，完成默认行为，作为修改行为的基础。也就是说，不管 `Proxy` 怎么修改默认行为，你总可以在 `Reflect` 上获取默认行为。

## 静态方法

1. `Reflect.get(target, name, receiver)`

    - 作用：`Reflect.get` 方法查找并返回 `target` 对象的 `name` 属性，如果没有该属性，则返回 `undefined`。

    - 如果 `name` 属性部署了读取函数 `getter`，则读取函数的 `this` 绑定 receiver。

    - 如果第一个参数不是对象，`Reflect.get` 方法会报错。

1. `Reflect.set(target, name, value, receiver)`

    - 作用：`Reflect.set` 方法设置 `target` 对象的 `name` 属性等于 `value`。

    - 如果 `name` 属性设置了赋值函数 `setter`，则赋值函数的 `this` 绑定 `receiver`。

    - 如果第一个参数不是对象，`Reflect.set` 会报错。

    - `Reflect.set` 会触发 `Proxy.defineProperty` 拦截。

1. `Reflect.has(obj, name)`

    - `Reflect.has` 方法对应 `name in obj` 中的 in 运算符。

    - 第一个参数不是对象，则 `Reflect.has` 会报错。

1. `Reflect.deleteProperty(obj, name)`

    - 等同于 `delete obj[name]`，用于删除对象的属性

    - 该方法返回一个布尔值。如果删除成功或者被删除的属性不存在，就返回 `true`。如果删除失败或者被删除的属性依然存在，则返回 `false`。

1. `Reflect.construct(target, args)`

    - 等同于 `new target(...args)`，提供了一种不使用 `new` 调用构造函数的方法。

1. `Reflect.getPrototypeOf(obj)`

    - 用于读取对象的 `__proto__` 属性，对应  `Object.getPrototypeOf(obj)`

    - 参数不是对象会报错。

1. `Reflect.setPrototypeOf(obj, newProto)`

    - 用于设置对象的 `__proto__` 属性，返回第一个参数对象。对应 `Object.setPrototypeOf(obj. newProto)`。

    - 第一个参数不是的对象会报错。

1. `Reflect.apply(func, thisArg, args)`

    - 等同于 `Function.prototype.apply.call(func, thisArg, args)`，用于绑定 `this` 对象后执行给定函数。

1. `Reflect.defineProperty(target, propertyKey, attributes)`

    - 等同于 `Object.defineProperty`，用来为对象定义属性。

1. `Reflect.getOwnPropertyDescriptor(target, propertyKey)`

    - 用于获取指定属性的描述对象

    - 第一个参数不是对象会报错。

1. `Reflect.isExtensible(target)`

    - 对应 `Object.isExtensible`，返回一个布尔值。
