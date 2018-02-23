---
title: centos-py2.7.10
date: 2017-02-09 17:41:10
tags:
categories:
---



1.准备好一份Python2.7.10源码包,下载地址:

http://www.python.org/ftp/python/2.7.10/Python-2.7.10.tgz

2.安装Python2.7,包括解压、编译、安装。

解压:tar -xvf Python-2.7.10.tar

建立一个Python2.7目录:mkdir /usr/local/python2.7

进入解压出的源码包目录:cd  Python-2.7.10

执行配置命令: ./configure --prefix=/usr/local/python2.7

执行编译和安装命令:make && make install

3.配置环境参数

将原来的python2.6改名:

mv  /usr/bin/python  /usr/bin/python2.6

建立软连接:

ln -s  /usr/local/python2.7  /usr/bin/python

编辑文件:vi /etc/profile

最下方加入:export PATH="/usr/local/python2.7/bin:$PATH"

保存后执行命令:source  /etc/profile

输入:python

可以看到环境已经是python2.7: