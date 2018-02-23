---
title: docker-config
date: 2016-12-06 09:21:17
tags: [docker]
categories: [docker]
---


## docker 配置

    centos: /lib/systemd/system/docker.service
    Ubuntu: /etc/default/docker
    DOCKER_OPTS="$DOCKER_OPTS --insecure-registry 10.211.55.17"
    
    centos:
    [root@iZ287o02a8dZ default]# vi /usr/lib/systemd/system/docker.service
    
    [Unit]
    Description=Docker Application Container Engine
    Documentation=https://docs.docker.com
    After=network.target
    
    [Service]
    Type=notify
    # the default is not to use systemd for cgroups because the delegate issues still
    # exists and systemd currently does not support the cgroup feature set required
    # for containers run by docker
    ExecStart=/usr/bin/dockerd \
              --insecure-registry index.boxlinker.com
    
    ExecReload=/bin/kill -s HUP $MAINPID
    # Having non-zero Limit*s causes performance problems due to accounting overhead
    # in the kernel. We recommend using cgroups to do container-local accounting.
    LimitNOFILE=infinity
    LimitNPROC=infinity
    LimitCORE=infinity
    # Uncomment TasksMax if your systemd version supports it.
    # Only systemd 226 and above support this version.
    #TasksMax=infinity
    TimeoutStartSec=0
    # set delegate yes so that systemd does not reset the cgroups of docker containers
    Delegate=yes
    # kill only the docker process, not all processes in the cgroup
    KillMode=process
    
    DOCKER_OPTS="$DOCKER_OPTS --insecure-registry 10.211.55.17"
    
    [Install]
    WantedBy=multi-user.target
    
