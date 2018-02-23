---
title: git
date: 2016-12-19 16:34:26
tags: [git]
categories: [git]
---

####  上传本地代码到github

#### 步骤

  `1` 建立git仓库; cd到你的本地项目根目录下

    $ git init

  `2` 将项目的所有文件添加到仓库中

	$ git add .

  `3` 将add的文件commit到仓库

	$ git commit -m "... init ..."

  `4` 将本地的仓库关联到github上

	$ git remote add origin git@github.com:liuzhangpei/alioss.git

  `5` 上传github之前，要先pull一下

	$ git pull origin master

  `6` 上传代码到github远程仓库

    $ git push -u origin master

s
####  强制提交

  git push 版本库地址 + 分支名 

    $ git push git@github.com:cabernety/boxlinker-git.git + master

  **注意**: "+" 是必须的，是代表强制push的意思，这次push成功了
