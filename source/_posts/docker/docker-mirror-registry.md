---
title: docker-mirror-registry
date: 2016-12-20 18:46:44
tags:
categories:
---


#### mirror for private registry

#### Docker mirror Registry 配置


#### 1 修改 registry 配置

	version: 0.1
	log:
	  fields:
	    service: registry
	storage:
	  cache:
	    blobdescriptor: inmemory
	  filesystem:
	    rootdirectory: /var/lib/registry
	http:
	  addr: :5000
	  headers:
	    X-Content-Type-Options: [nosniff]
	health:
	  storagedriver:
	    enabled: true
	    interval: 10s
	    threshold: 3

	# 以上为原始配置; 如果想使用 mirror 功能只需在下面增加 proxy 选项即可
	proxy:
	  remoteurl: https://registry-1.docker.io
      # username: [username]
	  # password: [password]

	# username 与 password 是可选项，当填写 username 与 password 以后就可以从 hub pull 私有镜像

#### 2 启动 mirror registry


    docker run -dt -v /data/registry:/var/lib/registry -v /root/mirr/config.yml:/etc/docker/registry/config.yml -p 5000:5000 registry:2.5.0

    到此就已经成功启动一个私有的镜像库并且带有 mirror 功能



    https://mritd.me/2016/09/24/Docker-mirror-Registry/?utm_source=tuicool&utm_medium=referral#registry--1



    http://www.oschina.net/news/57894/daocloud


    http://www.2cto.com/os/201403/285814.html


    http://blog.daocloud.io/how-to-master-docker-image/


    http://blog.daocloud.io/how-to-master-docker-image/



