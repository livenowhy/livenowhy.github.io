---
title: docker-registry
date: 2017-02-09 09:56:25
tags:
categories: [docker, registry]
---

#### docker Registry v2 认证

#### Registry v2 token 机制


  官方document: https://docs.docker.com/registry/spec/auth/token/
  
#### 认证步骤:
  
  ![认证流程图](./docker_registry_authentication.png)
  
  `1` Docker Client 尝试到registry中进行push/pull操作
  Attempt to begin a push/pull operation with the registry.
  
  `2` 如果registry需要认证,它会返回一个401未认证信息,并且返回的信息中还包含了到哪里去认证的信息。
  If the registry requires authorization it will return a 401 Unauthorized HTTP response with information on how to authenticate.
  
  `3` client发送认证请求到认证服务器(authorization service)
  The registry client makes a request to the authorization service for a Bearer token.
  
  `4` 认证服务器(authorization service)返回token
  The authorization service returns an opaque Bearer token representing the client’s authorized access.
  
  `5` client携带这附有token的请求，尝试请求registry
  The client retries the original request with the Bearer token embedded in the request’s Authorization header.
  
  `6` registry接受了认证的token并且使得client继续操作
  The Registry authorizes the client by validating the Bearer token and the claim set embedded within it and begins the push/pull session as usual.

  

#### 参考文章:
http://www.tuicool.com/articles/UrMFBn