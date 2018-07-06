---
title: Python 列表
date: 2018-07-05 19:45:24
tags: python
---

Python 列表与 JavaScript 中的数据有点类似。

Python 中定义列表如下：

```python
#!/usr/bin/env python3
a = [1, 2, 'a']
print(a) # [1, 2, 'a']
```

## 访问列表的值

列表是通过索引来访问列表中的每一个值。

```python
#!/usr/bin/env python3
a = [1, 2, 'a']
print(a[0]) # 1
print(a[2]) # a
```

当索引为负数的时候，则是从列表的末尾开始读取值。

```python
#!/usr/bin/env python3
a = [1, 2, 'a']
print(a[-1]) # a
print(a[-2]) # 2
```

## 获取列表长度

```python
#!/usr/bin/env python3
a = [1, 2, 3]
print(len(a)) # 3
```

## 检验某值是否在列表中

```python
#!/usr/bin/env python3
a = [1, 2, 3]
print(1 in a) # True
print('a' in a) # False
```

## 切片

python 的切片规则跟 JavaScript 中数组 `slice` 方法方法类似。我们可以理解切片其实就是提取切片中的某一部分。切片并不会改变正在操作的切片，它会返回一个新的列表。

```python
#!/usr/bin/env python3
a = [1, 2, 'a', 'b', 'c']
print(a[0:-1]) # [1, 2, 'a', 'b']
print(a[:-2]) # [1, 2, 'a']
print(a[:]) # [1, 2, 'a', 'b', 'c']
```

上面的例子可以看出，切片的基本语法为 `a[begin:end]`，它会从 `begin` 索引开始切，切到 `end` 索引之前（不包含 end 索引的列表值）。

当 `begin` 为空，默认为 0，当 `end` 为空时，默认为列表的长度。所以可以很容易地理解，`a[:]` 其实相当于把列表复制了一遍。

另外我们还可以给切片设置步长，例如下面这个例子：

```python
#!/usr/bin/env python3
a = [1, 2, 3, 4, 5, 'a', 'b', 'c']
print(a[::2]) # [1, 3, 5, 'b']
```

## 连接两个列表

python 中连接两个列表非常简单，直接将两个类表相加即可。

```python
#!/usr/bin/env python3
a = [1, 2, 3]
b = ['a', 'b', 'c']
print(a+b) # [1, 2, 3, 'a', 'b', 'c']
```

## 列表操作

```python
#!/usr/bin/env python3

a = [1, 2, 3]

a.append(4) # 往列表末尾添加元素
print(a) # [1, 2, 3, 4]

a.insert(1, 'a') # 在列表索引位置为 1 的地方插入元素
print(a) # [1, 'a', 2, 3, 4]

b = a.count('a') # 返回列表中 a 的个数
print(b) # 1

a.remove('a') # 移除列表中值为 a 的元素
print(a) # [1, 2, 3, 4]

a.reverse() # 反转列表
print(a) # [4, 3, 2, 1]

c = [9, 7, 5]
a.extend(c) # 将另一个列表的所有元素，添加到末尾
print(a) # [4, 3, 2, 1, 9, 7, 5]

a.sort() # 对列表进行排序
print(a) # [1, 2, 3, 4, 5, 7, 9]

del a[1] # 删除索引为 1 的列表元素
print(a) # [1, 3, 4, 5, 7, 9]
```

## 列表推导式

列表推导式为从列表中创建列表提供了简单的方法。列表推导式有点像 JavaScript 中的数组的 map 方法，但是在写多层循环上，列表推导式更加简洁。

```python
#!/usr/bin/env python2

# 不使用列表推导式创建一个列表

squares = []
for x in range(10):
	squares.append(x**2)

print(squares)

# 使用推导式

squares2 = [x**2 for x in range(10)]

print(squares2)
```

多层循环下，对比使用推导式和不使用推导式去创建一个列表

```python
#!/usr/bin/env python2

combs = []

for x in [1,2,3]:
	for y in [1,2,3]:
		if x != y:
			combs.append((x,y))

print(combs) # [(1, 2), (1, 3), (2, 1), (2, 3), (3, 1), (3, 2)]


combs2 = [(x,y) for x in [1,2,3] for y in [1,2,3] if x != y]

print(combs2) # [(1, 2), (1, 3), (2, 1), (2, 3), (3, 1), (3, 2)]
```