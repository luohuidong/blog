---
title: JS-Array.prototype.slice.call()
tags: javascript
date: 2019-01-03 15:43:02
---

在正常情况下，数组调用 `slice()`，`this` 值为执行 `slice()` 的数组。

```js
[1, 2, 3].slice()
```

当一个对象执行它的方法的时候，方法中的 `this` 的值为这个对象。因此上面的操作中，`[1, 2, 3]` 自然而然地成为 `slice()` 中的 `this` 的值。

如果将 `slice()` 中的 `this` 值替换为类数组的对象，同样也是生效的（所谓的类数组就是有值为数字的 `length` 属性，而其它的属性的 key 是数字索引，如函数中的 `arguments` 属性）。

下面的例子，则是通过 `call` 将 `slice()` 中的 `this` 值指向了一个类数组的对象。 

```js
const myObject = {
    '0': 'zero',
    '1': 'one',
    '2': 'two',
    '3': 'three',
    '4': 'four',
    length: 5
};

const result = Array.prototype.slice.call(myObject, 3) // ['three', 'four']
```

同样，如果执行下面的函数，则会返回一个带有所有参数的数组。

```js
function(a, b, c) {
    return Array.prototype.slice.call(arguments)
}
```

参考资料：

- [how does Array.prototype.slice.call() work?](https://stackoverflow.com/questions/7056925/how-does-array-prototype-slice-call-work)
