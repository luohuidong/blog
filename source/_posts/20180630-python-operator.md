---
title: Python 运算符
date: 2018-06-30 12:46:46
tags: python
---

## 基本数学操作符

```python
#!/usr/bin/env python3
print('2 + 3 = ', 2 + 3) # 加法
print('23.0 - 3 = ', 23.0 - 3) # 减法
print('2 * 2 = ', 2 * 2) # 乘法
print('22 / 12 = ', 22 / 12) # 除法
print('14 // 3 = ', 14 // 3) # 整除
print('14 % 3 = ', 14 % 3) # 求余
```

运行结果：

```
2 + 3 =  5
23.0 - 3 =  20.0
2 * 2 =  4
22 / 12 =  1.8333333333333333
14 // 3 =  4
14 % 3 =  2
```

只要有任意一个操作数是浮点数，结果就是浮点数

## 关系运算符

- `<`：小于
- `<=`：小于等于
- `>`：大于
- `>=`：大于等于
- `==`：等于
- `!=`：不等于

```python
#!/usr/bin/env python3
print('1 < 2', 1 < 2) # 小于
print('1 <= 2', 1 <= 2) # 小于等于
print('1 > 2', 1 > 2) # 大于
print('1 >= 2', 1 >= 2) # 大于等于
print('1 == 2', 1 == 2) # 等于
print('1 != 2', 1 != 2) # 不等于
```

运行结果：

```
1 < 2 True
1 <= 2 True
1 > 2 False
1 >= 2 False
1 == 2 False
1 != 2 True
```

## 逻辑运算符

```python
#!/usr/bin/env python3
print('5 and 4:', 5 and 4) # 逻辑“与”
print('5 or 4:', 5 or 4) # 逻辑“或”
print('not 5 > 4:', not 5 > 4) # 逻辑“非”
```

运行结果：

```python
5 and 4: 4
5 or 4: 5
not 5 > 4: False
```

## 简写运算符

```python
#!/usr/bin/env python3
a = 12
a += 13
print('a:', a)
```

运行结果：

```
a: 25
```

## 类型转换

```python
#!/usr/bin/env python3
print('float("31.32摄氏度")', float("31摄氏度")) # 字符串转浮点值
print('int("31.32摄氏度")', int("31.32摄氏度")) # 字符串转整数值
print('str(31)', str(31)) # 整数转字符串
print('str(31.32)', str(31.32)) # 浮点值转字符串
```
