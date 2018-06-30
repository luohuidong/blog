---
title: JavaScript try-catch 语句
date: 2018-06-30 22:26:55
tags: javascript
---

基本语法：

```js
try {
  // 可能会导致错误的代码
} catch (error) {
  // 在错误发生时要执行的代码
  // error.message 保存着错误消息
  // error.name 保存着错误类型
}
```

try 块中的任何代码发生了错误，就会立即退出代码执行过程，然后执行 catch 块。

## finally 子句

基本语法：

```js
try {
  // 可能会导致错误的代码
} catch (error) {
  // 发生错误时执行的代码
} finally {
  // 一定会执行的代码
}
```

finally 子句在 try-catch 语句中是可选的。

但是只要 finally 子句一经使用，则 finally 块中的代码一定会执行，即便 try 块 和 catch 块中有 return 语句。

## 错误类型

### Error

Error 是基类型，其他错误类型都继承自该类型，一般比较少见，主要目的是供开发人员抛出自定义错误。

### EvalError

EvalError 类型的错误，在没有把 `eval()` 当成函数调用时，就会抛出错误。

在实际开发中，极少会使用 `eval()`，所以这种错误比较少见。

关于 `eval()` 相关资料，请参考 https://devdocs.io/javascript/global_objects/eval

### RangeError

RangeError 类型的错误，会在数值超出相应范围时触发。

如在定义数组时，指定了数组不支持的项数。

```js
var items = new Array(-20);
```

### ReferenceError

在找不到对象的情况下，会发生 ReferenceError 类型的错误。

```js
var obj = x; // 当 x 未声明的情况下，会抛出 ReferenceError 类型的错误。
```

### SyntaxError

SyntaxError（语法错误） 一般比较少会出现，因为语法错误会使得 JavaScript 代码立即停止执行。

### TypeError

执行特定于 **类型** 的操作时，变量的类型并不符合要求所致。

```js
const a = ''
a = 'Hello World'
```

当尝试改变常量 a 的值的时候，就会发生 TypeError。

### URIError

在使用 `encodeURI()` 或 `decodeURI()`，而 URI 格式不正确时，就会导致 URIError 错误。这种错误比较少见，因为这两个函数的容错性非常高。

### 根据错误类型作出恰当处理

```js
try {
  // 可能发生错误的代码
} catch (error) {
  if (error instanceof TypeError) {
    // 处理类型错误的代码
  } else if (error instanceof ReferenceError) {
    // 处理引用错误的代码
  } else {
    // 处理其他类型错误的代码
  }
}
```

## 使用 try-catch 注意点

1. 当 try-catch 语句中发生错误时，浏览器会认为该错误已经被处理了，因此浏览器并不会向用户报告 JavaScript 错误。

1. 使用 try-catch 最适合处理那些我们无法控制的错误。

1. 当清楚知道自己的代码会发生错误时，再使用 try-catch 就不太合适了。
