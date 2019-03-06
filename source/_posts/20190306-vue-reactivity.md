---
title: Vue 响应式原理
tags:
  - frontend
  - vue
  - mvvm
date: 2019-03-06 13:57:26
---


Vue 是如何跟踪数据的？其中一个非常关键的函数就是 `Object.defineProperty`。


```javascript
let obj = {
  name: 'zhangsan',
}
```

如果希望 `obj` 中的属性在读取时，或者修改时被监听到，应该怎么做？我们利用 `Object.defineProperty` 改造一下 `obj`。

```javascript
let obj = {}
let name = 'zhangsan'
Object.defineProperty(obj, 'name', {
  get: function() {
    console.log('get')
    return name
  },
  set: function(newVal) {
    console.log('set')
    name = newVal
  }
})
```

经过上面的改造，`obj` 在读取或者修改 `name` 属性的时候就能被监听到了。

我们来模拟一下 Vue 的实例是如何监听数据的。在 Vue 的语法中，给 Vue 实例添加数据以及对数据进行处理的例子如下：

```js
// Our data object
let data = { a: 1 }

// The object is added to a Vue instance
let vm = new Vue({
  data: data
})

// Getting the property on the instance
// returns the one from the original data
vm.a == data.a // => true

// Setting the property on the instance
// also affects the original data
vm.a = 2
data.a // => 2

// ... and vice-versa
data.a = 3
vm.a // => 3
```

我们利用 `Object.defineProperty` 来模拟一下 Vue 这个功能的大致实现。

```js
let vm = {}
let data = { a: 1 }

for (let key in data) {
  Object.defineProperty(vm, key, {
      get: function() {
          console.log('get')
          return data[key]
      },
      set: function(newValue) {
          console.log('set')
          data[key] = newValue
      }
  })
}
```

此时只要读取或者修改 vm 上的属性，都会被监控到，而且修改的时候，还会同步修改 data 中的属性值。

经过上面的模拟，就能非常容易理解，为什么 Vue 在经过 `new Vue()` 初始化之后，直接对实例添加属性是无效的，因为并没有经过 `Object.defineProperty` 的处理，应对这个问题 Vue 提供了一个 `$set()` 的实例方法。

另外在下一代 Vue (Vue 3.0) 中，将会使用 ES6 中的 Proxy 代替 `Object.defineProperty`。Vue 的作者在 [Plans for the Next Iteration of Vue.js](https://medium.com/the-vue-point/plans-for-the-next-iteration-of-vue-js-777ffea6fabf) 这篇文章中提到了使用 Proxy 代替 `Object.defineProperty` 的原因。

我们在对例子进行改造一下，用 Proxy 来实现 Vue 对数据的监听。

```js
let data = { a: 1 }

let vm = new Proxy(data, {
  get: function(target, key, receiver) {
    console.log('get')
    return Reflect.get(target, key, receiver);
  },
  set: function(target, key, value, receiver) {
    console.log('set')
    return Reflect.set(target, key, value, receiver);
  }
})
```

## 参考资料

- [深入响应式原理](https://cn.vuejs.org/v2/guide/reactivity.html)
- [Plans for the Next Iteration of Vue.js](https://medium.com/the-vue-point/plans-for-the-next-iteration-of-vue-js-777ffea6fabf)
- [Proxy](http://es6.ruanyifeng.com/#docs/proxy)
