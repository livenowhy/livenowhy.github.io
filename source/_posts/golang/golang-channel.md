---
title: golang-channel
date: 2016-12-09 08:54:25
tags: [golang]
categories: [golang]
---


### channel 通道

  通道又叫 channel, channel的作用就是在多线程之间传输数据。
  
    chrw := make(chan int)      // 创建无缓冲 channel
    chor := make(<-chan int)    // 创建只读channel
    chow := make(chan<- int)    // 创建只写channel

#### 生产者/消费者

  生产者产生一些数据将其放入 channel;
  然后消费者按照顺序,一个一个的从 channel 中取出这些数据进行处理.
  当 channel 的缓冲用尽时,生产者必须等待(阻塞)。换句话说,若是 channel 中没有数据,消费者就必须等待了.

    package main
    
    import (
        "fmt"
        "time"
    )
    
    // 生产者
    func producer(c chan int64, max int) {
        defer close(c)   // 退出的时候关闭 channel
    
        for i:=0; i < max; i++ {
            c <- time.Now().Unix()
        }
    }
    
    // 消费者
    func consumer(c chan int64) {
        var v int64
        ok := true
    
        for ok {
            if v, ok = <- c; ok {
                fmt.Println(v)
            }
        }
    
    }
    
    func main() {
        c := make(chan int64)
        go producer(c, 10)
        consumer(c)
    }


#### Go Channel基本操作语法

    c := make(chan bool)  // 创建一个无缓冲的bool型Channel 
    c <- x                // 向一个Channel发送一个值
    <- c                  // 从一个Channel中接收一个值
    x := <- c             // 从Channel c接收一个值并将其存储到x中
    x, ok = <- c          // 从Channel接收一个值,如果channel关闭了或没有数据,那么ok将被置为false
    
    不带缓冲的 Channel 兼具通信和同步两种特性.


#### Channel用作信号(Signal)的场景

  `1` 等待一个事件(Event)


   http://studygolang.com/articles/4570
   
   http://tonybai.com/2014/09/29/a-channel-compendium-for-golang/




以下实例发生错误: fatal error: all goroutines are asleep - deadlock!
func main() {
   ch1 := make(chan int)
   ch1 <- 1

   cc := <- ch1
   fmt.Println(cc)
   /** fatal error: all goroutines are asleep - deadlock! */
}

这个错误的意思是说线程陷入了死锁,程序无法继续执行下去:
创建一个无缓冲的channel，然后给这个channel赋值了，程序就是在赋值完成之后陷入了死锁。
因为创建的channel是无缓冲的，即同步的，赋值完成之后来不及读取channel，程序就已经阻塞了。

这里有一个非常重要的概念:channel的机制是先进先出，如果给channel赋值，那么必须要读取它的值，不然就会造成阻塞，当然这个只对无缓冲的channel有效。
对于有缓冲的channel，发送方会一直阻塞到数据被拷贝到缓冲区;如果缓冲区已满，则发送方只能在接收方取走数据之后才能从阻塞状态恢复。