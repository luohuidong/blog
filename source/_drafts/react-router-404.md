---
title: React Router 404 问题
tags: 
- javascript 
- react 
- react-router
---

## React Router 通过直接输入 URL 出现报错

在开发单页面应用的时候，通过输入 url 进入页面的时候会显示 404。这时候就需要设置 server 将所有的页面都指向 index.html 这个页面。

如果时通过 webpack 开发的话，只需要在 devServer 中添加以下内容：

```js
devServer: {
  ...
  historyApiFallback: true,
  ...
}
```

参考资料：

- [Usage with React Router](https://redux.js.org/advanced/usage-with-react-router#configuring-the-fallback-url)
- [devServer.historyApiFallback](https://webpack.js.org/configuration/dev-server/#devserver-historyapifallback)
- [How to tell webpack dev server to serve index.html for any route](https://stackoverflow.com/questions/31945763/how-to-tell-webpack-dev-server-to-serve-index-html-for-any-route)
- [PUSHSTATE WITH WEBPACK-DEV-SERVER](https://jaketrent.com/post/pushstate-webpack-dev-server/)

## HtmlWebpackPlugin injects relative path files which breaks when loading non-root website paths

- [HtmlWebpackPlugin injects relative path files which breaks when loading non-root website paths](https://stackoverflow.com/questions/34620628/htmlwebpackplugin-injects-relative-path-files-which-breaks-when-loading-non-root/34628034#34628034)
