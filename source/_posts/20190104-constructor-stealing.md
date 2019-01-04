---
title: JS-借用构造函数方式继承为何父类原型对子类不可见？
tags: javascript
date: 2019-01-04 01:21:48
---


下面这个例子实现了子类通过借用父类构造函数的方式来实现继承。

```js
function SuperType(name) {
    this.name = name
}

SuperType.prototype.sayName = function() {
    console.log('this.name', this.name)
}

function SubType(name) {
    SuperType.call(this, name)
}

const obj = new SubType('Allan');
obj.sayName() // TypeError: obj.sayName is not a function
```

这个例子可以看到，`SubType` 的实例`obj` 并不能调用 `SuperType` 原型中的函数。

子类的构造函数中，仅仅只是通过 `call` 的方式去调用父类的构造函数。这种调用方法其实只是将父类的构造函数当做普通的函数来使用。因此父类与子类的关系完全等价于下面的例子：

```js
function commonFunction(this, name) {
    this.name = name
}

function SubType(name) {
    commonFunction(this, name)
}
```

因此子类的实例根本无法获取父类的原型。
