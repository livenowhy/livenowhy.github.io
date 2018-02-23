---
title: docker-7-net
date: 2016-12-29 09:14:07
tags: [docker, net]
categories: [docker]
---


####  网络配置

#### 端口映射

  **注意**: 容器有自己的内部网络和IP地址(使用docker inspect + 容器ID可以获取所有的变量值)
  
  在执行docker run的时候如果添加 --rm 标记,则容器在终止后会立即删除。注意, --rm 和 -d 参数不能同时使用。
  
  
#### 容器互联
   使用 --link 参数可以让容器之间安全的进行交互。
   
   
   docker-compose up --force-recreate