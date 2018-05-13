---
title: 运行多个 npm script
tags: npm
date: 2018-05-13 23:40:59
---

# 1. 多个 npm script 串行

用 `&&` 符号将多个 npm script 串起来即可

```json
"scripts": {
    "lint:js": "eslint *.js",
    "lint:css": "stylelint *.less",
    "lint:json": "jsonlint --quiet *.json",
    "lint:markdown": "markdownlint --config .markdownlint.json *.md",
    "test": "npm run lint:js && npm run lint:css && npm run lint:json && npm run lint:markdown && mocha tests/"
}

```

串行执行的时候，如果前序命令失败，后续全部命令都会终止。

# 2. 多个 npm script 并行

npm script 的并行，就是将串行的 `&&` 符号改为 `&` 即可。

多个 npm script 并行运行的时候，可能会出现进程结束之后，结果才会输出的情况

# 3. npm-run-all（推荐）

[npm-run-all](https://github.com/mysticatea/npm-run-all) 实现更轻量和简洁的多命令运行。

`npm-run-all` 的串行运行如下：

```json
"scripts": {
    ...
    "test": "npm-run-all lint:js lint:css lint:json lint:markdown mocha"
    ...
}
```

可使用通配符进一步简化：

```json
"scripts": {
    ...
    "test": "npm-run-all lint:* mocha"
    ...
}
```

并行运行：

```json
"scripts": {
    ...
    "test": "npm-run-all --parallel lint:* mocha"
    ...
}
```