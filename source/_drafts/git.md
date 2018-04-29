---
title: git
tags: git
---

# 1. Git 配置 (git config)

```bash
git config --global user.name "username"
git config --global user.email "useremail"
```

设置的名字和 email 作为提交 commit 时的签名，每次提交记录里都会包含这些信息。当执行完上面的命令，当前用户的 home 目录会建立一个 `.gitconfig` 的文件。这个配置文件为 Git 的全局文件。

如果想要某个项目中的 git 配置与全局设置的不一样，则可以在项目中使用 `git config` 而不带 `--global` 选项来设置。

# 2. 获取 Git 仓库

获取 Git 仓库有两种方式，第一种通过 Clone 一个仓库，另一种是本地初始化一个新的仓库

## 2.1. Clone 一个仓库 (git clone)

```bash
git clone git clone url
```

## 2.2. 初始化一个新的仓库 (git init)

在当前文件夹运行下面的命令，会生成一个 `.git` 的目录，这意味着一个仓库被初始化了。

```bash
git init
```

# 3. 代码提交

## 3.1. 查看当前仓库状态 (git status)

当创建了文件或者修改了文件，可以通过 `git status` 命令，查看当前 git 仓库的状态。

## 3.2. 添加文件到本地缓存区 (git add)

当创建了文件，或者修改了文件，则可以将这些文件添加到本地缓存区。

```bash
git add filename
```

## 3.3. 查看缓存区中文件修改 (git diff --cached)

需要查看缓存区中哪些文件被修改，可以输入 `git diff --cashed`。进到到查看页面之后，需要输入 `q` 才可以推出。

## 3.4. 提交本地仓库 (git commit)

当修改的文件都添加到缓存区，就需要提交到本地仓库。

```bash
git commit -m "comments"
```

用下面的命令，可以将没有加到缓存区的修改也一起提交，但 `-a` 命令不会添加新建文件

```bash
git commit -a -m "comments"
```

## 3.5. 删除文件 (git rm)

删除文件可以用以下命令，删除后会自动将已删除文件的信息添加到缓存区, `git commit` 提交后就会将本地仓库中对应文件所删除。

## 3.6. 本地仓库关联远端服务器 (git remote add)

```bash
git remote add hostname url
```

`git remote add` 命令用于添加远程主机。

`hostname` 为主机名称，`url` 为主机地址

当本地仓库连接到了远程 Git 服务器，可以使用下面的命令将本地仓库同步到远端服务器

## 3.7. 本地仓库同步到远端服务器 (git push)

```bash
git push hostname branchname
```

`hostname` 为主机名称，`branchname` 为分支名称

# 分支与合并

## 创建和查看分支 (git branch)

下面的命令，创建了一个叫 experimental 的分支。

```bash
git branch experimental
```

运行 `git branch` 就可以查看当前分支的列表，以及目前的开发环境处于哪个分支上。

## 切换分支

