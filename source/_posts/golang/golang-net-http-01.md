---
title: golang-net-http-01
date: 2016-12-24 12:27:30
tags: [golang, http, net]
categories: [golang]
---


####  golang中net/http


  http包包含http客户端和服务端的实现,利用Get,Head,Post,以及PostForm实现HTTP或者HTTPS的请求.
  当客户端使用完response body后必须使用close对其进行关闭.如下所示:
  
  
    resp, err := http.Get("http://example.com/")
    if err != nil {
        // handle error
    }
    
    defer resp.Body.Close()
    body, err := ioutil.ReadAll(resp.Body)
    
    // ... 
    