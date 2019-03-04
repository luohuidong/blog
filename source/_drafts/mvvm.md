---
title: MVVM
tags: frontend
---

## jQuery 与 MVVM 的对比

我们熟知的 React、Vue 都是 MVVM 框架，在了解 MVVM 之前，先看一下 jQuery 与 Vue 实现一个简单的 Todo List 的代码。

jQuery 实现:

```html
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Document</title>
    <script
        src="https://code.jquery.com/jquery-3.3.1.min.js"
        integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8="
        crossorigin="anonymous"
    ></script>
</head>

<body>
    <div>
        <input type="text" name="" id="txt-title">
        <button id="btn-submit">submit</button>
    </div>

    <div>
        <ul id="ul-list"></ul>
    </div>
</body>

</html>
<script>
    var $txtTitle = $('#txt-title')
    var $btnSubmit = $('#btn-submit')
    var $ulList = $('#ul-list')

    $btnSubmit.click(function() {
        var title = $txtTitle.val()
        if (!title) {
            return
        }
        var $li = $('<li>' + title + '</li>')
        $ulList.append($li)
        $txtTitle.val('')
    })
</script>
```

Vue 实现：

```html
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Document</title>
    <script src="https://cdn.jsdelivr.net/npm/vue"></script>
</head>

<body>
    <div id="app">
        <div>
            <input type="text" v-model="title">
            <button v-on:click="add">submit</button>
        </div>
        <ul>
            <li v-for="item in list">{{item}}</li>
        </ul>
    </div>
</body>

<script>
    const vm = new Vue({
        el: '#app',
        data: {
            title: '',
            list: []
        },
        methods: {
            add: function() {
                this.list.push(this.title)
                this.title = ''
            }
        }
    })
</script>

</html>
```

jQuery 实现的代码中，是通过操作 DOM 来添加新的 List 项。在 click 事件回调中，数据与视图的处理逻辑是混杂在一起的。

而 Vue 实现的代码中，click 事件回调的处理逻辑仅仅只是改变了数据，而没有直接操作 DOM 改变视图。也就是说，Vue 的数据与视图是分离的。

另外 Vue 的例子当中，是以数据驱动视图的。通俗一点就是，我只改数据，视图怎么更改我是不知道的，也不需要关心。相比之下 jQuery 的例子当中，是通过 `append($li)` 操作，直接将 `li` 元素插入到视图当中的，并且连 `$txtTitle` 的值也是手动来情况的。

这里提一下 React 与 Vue 中的数据与视图的是什么。React 中的数据与视图分别为 state 定义数据与 JSX 所写的代码。而 Vue 中的数据与视图分别为 data 中定义的数据与 template 中定义的代码。

jQuery 中数据与视图混杂，是非常不利于后期的维护的，如果项目复杂，要新增一个功能或者修复一个 bug 并不容易，而 MVVM 框架数据与视图分离的目的就是为了解耦。从这一点就应该了解到 MVVM 出现的原因了。

总结一下 jQuery 与 MVVM 框架的区别：

- 数据与视图的分离
- 以数据驱动视图，只关心数据变化，DOM 操作被封装

## MVVM

说到 MVVM，一定会联想到 MVC。

这里列举一些我看 MVC 的资料:

- [YouTube: What Is MVC? Simple Explanation](https://www.youtube.com/watch?v=pCvZtjoRq1I)
- [Medium: What is MVC, and how is it like a sandwich shop?](https://medium.freecodecamp.org/simplified-explanation-to-mvc-5d307796df30)
- [Wikipedia: Model–view–controller](https://en.wikipedia.org/wiki/Model%E2%80%93view%E2%80%93controller)
- [Medium: 跟著小明一起搞懂技術名詞：MVC、SPA 與 SSR](https://medium.com/@hulitw/introduction-mvc-spa-and-ssr-545c941669e9)
- [Medium: Model-View-Controller (MVC) Explained Through Ordering Drinks At The Bar](https://medium.freecodecamp.org/model-view-controller-mvc-explained-through-ordering-drinks-at-the-bar-efcba6255053)
- [stack overflow: What are MVP and MVC and what is the difference?](https://stackoverflow.com/questions/2056/what-are-mvp-and-mvc-and-what-is-the-difference)
- [Brainvire: Six Benefits of Using MVC Model for Effective Web Application Development](https://www.brainvire.com/six-benefits-of-using-mvc-model-for-effective-web-application-development/)

