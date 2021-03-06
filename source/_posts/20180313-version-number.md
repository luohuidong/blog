---
title: nodejs 版本号说明
date: 2018-03-13 21:23:16
tags: node
---

## 版本号格式

最常见的版本号是 `x.y.z` 格式，如 `4.3.31`。

## 升级规则

1. z 位在修复 bug 的时候升级。
2. y 位在有新增的功能，并且保证兼容以前的版本的时候升级。
3. x 位在大版本升级，而且不保证兼容的时候升级

## 常见的版本号类型

- `1.*`

    这种情况下安装包的版本保证 x 位，y 位不变，但是 z 位会保持最新的。

    `~1.2.0` 与 `1.2.*` 的含义是一样的。

- `2.x`

    这个情况下安装包的版本保证 z 位不变，y 位与 x 位都使用最新的。

    `^2.0.0` 与 `2.x` 的含义是一样的。