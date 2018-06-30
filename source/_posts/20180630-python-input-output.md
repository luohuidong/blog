---
title: Python 输入输出
date: 2018-06-30 12:46:18
tags: python
---

运行环境：Ubuntu 16

终端执行 `python3` 进入 python 交互模式。

## input 读取用户输入

`input([prompt])` 读取的输入，将转化为字符串输出。

prompt 参数可传可不传。如果传入，则作为提示信息输出。

```
>>> input()
Hello world!
'Hello world!'
>>>

>>> input('Tell me what is your name? ')
Tell me what is your name? allan
>>> 'allan'
```

## print 将内容输出

`print(*objects, sep=' ', end='\n', file=sys.stdout, flush=False)`

- `*objects`：表示可以一次输出多个对象。输出多个对象时，用 `,` 分割。
- sep：定义用什么来分隔多个对象。
- end：定义用什么来结尾。

```
>>> print('a', 'b', sep=' & ', end='\n')
a & b
```
