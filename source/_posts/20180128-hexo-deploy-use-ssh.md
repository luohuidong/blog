---
title: Hexo免密部署到GithubPages
date: 2018-01-28 21:51:26
tags: Hexo
---

本文假设已经安装好了 node，git，hexo。

# 1. 新建GithubPages

1. 登陆 Github 之后，点击 New repository，转跳到创建新仓库的页面

2. 在创建仓库的页面中，填写新仓库的名字，新仓库的命名规则为 `username.github.io`，如你的 username （用户名） 为 luohuidong，则这个仓库的命名就应该为 `luohuidong.github.io`

3. 创建完仓库之后，请记下 SSH URLs，这个后面在修改 hexo _config.yml 文件配置的时候要用到。

# 2. _config.yml文件配置

将 Hexo 部署到 Github Pages 之前，需要对 _config.yml 中的参数进行修改。

在 _config.yml 文件的最下面，可以看到下面这段代码

```
deploy:
  type:
```

我们需要对这段代码进行一下修改

```
deploy:
  type: git
  repo: <这里填写你SSH URLs>
  branch: master
```

# 3. 生成SSH私钥与公钥

打开 Git Bash，运行命令 `cd .ssh/`，`ls` 查看当前文件是否已经有公钥和私钥了，如果有的话，则不用生成了。

如果没有的话，运行命令 `ssh-keygen`，运行完之后，会生成两个文件，id_rsa （私钥） 和 id_rsa.pub （公钥） 这两个文件。

有了公钥之后，在公钥的当前文件夹运行 `cat id_rsa.pub | clip`，则会将公钥文件中的内容内容放在剪贴板上。

# 4. 将公钥添加到Github

1. 在 Github 页面点击右上角自己的头像。
1. 选择 settings。
1. 选择 SSH and GPG keys
1. 点击 new SSH key
1. 将公钥复制到 key 文本输入框中
1. 点击 Add SSH key 按钮

# 5. 测试SSH连接

打开 Git Bash 运行 `ssh -t git@github.com`

运行完命令之后会有下面的提示

```
The authenticity of host 'github.com (IP ADDRESS)' can't be established.
RSA key fingerprint is 16:27:ac:a5:76:28:2d:36:63:1b:56:4d:eb:df:a6:48.
Are you sure you want to continue connecting (yes/no)?
```

或者

```
The authenticity of host 'github.com (IP ADDRESS)' can't be established.
RSA key fingerprint is SHA256:nThbg6kXUpJWGl7E1IGOCspRomTxdCARLviKw6E5SY8.
Are you sure you want to continue connecting (yes/no)?
```

这时输入 yes 即可。如果提示中的 fingerprint 认证成功的话，则会有下面的提示

```
Hi username! You've successfully authenticated, but Github does not
provide shell access.
```

# 6. 将hexo部署到Github

历经千辛万苦，终于可以将 hexo 部署到 Github 了。在 hexo 博客文件夹打开命令行，然后运行 `hexo generate --deploy` ，就会自动部署啦。部署完之后，打开你的 Gighub pages 就能看到你的博客了。

# 7. 参考资料

1. [hexo官方文档](https://hexo.io/docs/)

1. [服务器上的Git-生成SSH公钥](https://git-scm.com/book/zh/v1/%E6%9C%8D%E5%8A%A1%E5%99%A8%E4%B8%8A%E7%9A%84-Git-%E7%94%9F%E6%88%90-SSH-%E5%85%AC%E9%92%A5)

1. [Connecting to Github with SSH](https://help.github.com/articles/connecting-to-github-with-ssh/)

1. [使用SSH密钥连接Github](https://www.xuanfengge.com/using-ssh-key-link-github-photo-tour.html)
