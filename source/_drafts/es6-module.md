---
title: ES6 Module 要点
tags: javascript
---

- ES6 模块默认使用严格模式。

- exprot 命令：
    
    ```js
    export var firstName = 'Michael';
    ```

    上面的写法等价于下面的写法：

    ```js
    var firstName = 'Michael';

    export { firstName }
    ```

    输出的变量可以使用 `as` 重命名：

    ```js
    function v1() { }

    export {
        v1 as streamV1
    };
    ```

    export 语句输出的接口与其对应的值是动态绑定的关系，即通过接口可以获取到模块内部实时的值。

- import 命令：

    import 命令具有提升效果，会提升到整个模块的头部首先执行。import 命令是编译阶段执行的，在代码运行之前。

    ```js
    import { firstName } from './profile';
    ```

    为输入的变量重命名：

    ```js
    import { lastName as surname } from './profile';
    ```
