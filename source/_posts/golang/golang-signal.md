---
title: golang-signal
date: 2016-12-16 09:56:04
tags: [signal]
categories: [golang]
---



##  Golang 的 signal

  在实际项目中我们可能有下面的需求:
  `1` 修改了配置文件后,希望在不重启进程的情况下重新加载配置文件
  `2` 当用 Ctrl + C 强制关闭应用后,做一些必要的处理
  
  这时候就需要通过信号传递来进行处理了。
  golang中对信号的处理主要使用os/signal包中的两个方法:
  一个是notify方法用来监听收到的信号;一个是 stop方法用来取消监听。
  
  
  监听信号-notify方法原型:
  
    func Notify(c chan<- os.Signal, sig ...os.Signal)
    
  第一个参数表示接收信号的管道 
  第二个及后面的参数表示设置要监听的信号,如果不设置表示监听所有的信号。
  
####  示例代码

 `1`
      
    package main
    
    import (
        "fmt"
        "os"
        "os/signal"
    )
    
    func one() {
        c := make(chan os.Signal)
        signal.Notify(c)
    
        //signal.Notify(c, syscall.SIGHUP, syscall.SIGUSR1) // 监听指定信号
        s := <-c // /阻塞直至有信号传入
        fmt.Println("get signal:", s)
    }
    
    func main() {
        /*
         * 当按下 ctrl +c 键时,
         * go run one.go
         * get signal: interrupt   (终端输出)
         */
        one()
    }
    
  `2`
  
    package main
    
    import (
        "fmt"
        "os"
        "os/signal"
        "time"
    )
    
    func SignalListen()  {
        c := make(chan os.Signal)
        signal.Notify(c)
    
        // 当调用了该方法后, 下面的for循环内 <-c 接收到一个信号就退出了
        //signal.Stop(c)
        for {
            s := <-c
            // 收到信号后的处理，这里只是输出信号内容，可以做一些更有意思的事
            fmt.Println("get siginal: ", s)
        }
    }
    
    func main() {
        go SignalListen()
        time.Sleep(time.Hour)
    }