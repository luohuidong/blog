---
title: 项目准备
tags:
- eslint
- 项目初始化
---

## JavaScript 代码检测

在编写 JavaScript 代码的时候，利用代码检测提示工具，可以检测所写的代码是否符合语法规范，也可以检测所写代码中是否存在语法错误。

### ESlint

[ESlint](https://eslint.org/) 是其中一个比较出名的 JavaScript 代码检测工具。ESlint 简单的介绍和安装方法可参照 [Getting Started with ESLint](https://eslint.org/docs/user-guide/getting-started)。

### eslint-plugin-react

ESlint 支持检测 JavaScript 和 JSX，但并不意味着 ESlint 天然地支持检测 React，因此需要使用 [eslint-plugin-react](https://github.com/yannickcr/eslint-plugin-react)，让 ESlint 能识别 React 语法。

### babel-eslint

ESlint 默认是使用 
