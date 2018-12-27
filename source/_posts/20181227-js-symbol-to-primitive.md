---
title: JS-如何让对象转换为有意义的原始类型？
date: 2018-12-27 10:44:58
tags: javascript
---

我们知道，对象可以转换为 `Boolean` 类型（所有的对象转换为 `Boolean` 所得的值为 `true` ），但是却没法转换为有意义的 `String` 类型和 `Number` 类型，如下面的例子：

```js
let obj = {
  foo: 'bar'
}

const result1 = String(obj)
console.log('result1: ', result1) // [object Object]

const result2 = Number(obj)
console.log('result2: ', result2) // NaN
```

## Symbol.toPrimitive

如果想让对象转换成有意义 `String` 类型或者 `Number` 类型，则可以利用对象的 Symbol.toPrimitive 属性。这个属性指向一个方法，当对象被转换为原始类型的值时会调用这个方法。

这个方法会接受一个参数，这个参数表明了对象会进行什么类型的原始类型转换，这个参数有三个值：

- "number"
- "string"
- "default"


下面的例子，展示了如何利用 `Symbol.toPrimitive` 这个属性，让对象可以被转换为有意义的 `String` 类型与 `Number` 类型。

```js
let obj = {
  [Symbol.toPrimitive](hint) {
    if (hint == 'number') {
      return 1;
    }
    if (hint == 'string') {
      return "I'm string";
    }
    return true;
  }
}

const result1 = String(obj)
console.log('result1: ', result1) // I'm string

const result2 = Number(obj)
console.log('result2: ', result2) // 1
```

## valueOf, toString 属性

除了 `Symbol.toPrimitive` 这个值属性之外，对象 valueOf 与 toString 属性，跟对象转换为原始类型有关。

在不存在 `Symbol.toPrimitive` 的情况下 (`Symbol.toPrimitive` 的优先级最高)，如果将对象转换为数字，则会调用 valueOf 属性所对应的函数。如果将对象转换为字符串，则会调用 toString 所对应的函数。

需要注意的是，valueOf 需要返回值的类型需要为数字，如果返回值不能转换为数字，则会返回 `NaN`。

```js
const obj = {
    valueOf() {
        return 1
    },
    toString() {
        return 111111
    }
}

const result1 = Number(obj)
console.log('result1: ', result1); // 1

const result2 = String(obj)
console.log('result2: ', result2); // 111111
```

参考资料：

- [MDN - Symbol.toPrimitive](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Symbol/toPrimitive)
- [阮一峰 ES6 入门 - Symbol.toPrimitive](http://es6.ruanyifeng.com/#docs/symbol#Symbol-toPrimitive)
