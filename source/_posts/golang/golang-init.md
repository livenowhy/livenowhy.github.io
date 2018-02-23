---
title: golang-init
date: 2016-12-27 09:18:54
tags:
categories: [golang]
---


#### golang init()函数

  Go语言为特殊目的保留了两个函数名:init()函数(可以出现在任何包里)和main()函数(只在main包里)。
  这两个函数既不可以接受任何参数，也不返回任何结果。
  init()函数会在main()函数之前执行。