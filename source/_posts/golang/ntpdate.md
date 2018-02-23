---
title: ntpdate
date: 2016-12-05 18:45:43
tags: [linux]
categories: [linux]
---



## linux 时间设置

#### 校正时间

  当Linux服务器的时间不对的时候,可以使用ntpdate工具来校正时间
    
    $ yum install ntpdate
    $ ntpdate <ip>    任意提供 ntpdate 服务的服务器,(阿里云服务器 ip)
