---
title: golang-panic-recover
date: 2016-12-17 14:03:34
tags: [golang, panic]
categories: [golang]
---


#### panic --> defer --> recover

  Go中可以抛出一个 panic 的异常,然后在 defer 中通过 recover 捕获这个异常,然后正常处理.
 
    package main
    
    import "fmt"
    
    func FunPanic()  {
        fmt.Println("FunPanic begin")
        panic(55)
        fmt.Println("FunPanic   end")
    }
    
    
    func main() {
        defer func() {  //必须要先声明defer，否则不能捕获到panic异常
            fmt.Println("defer begin")
    
            if err := recover(); err != nil {
                fmt.Println(err)  // 这里的err其实就是panic传入的内容，55
            }
            fmt.Println("defer end")
        }()
    
        fmt.Println("main one")
        FunPanic()
    }
    
    /**  输出
    main one
    FunPanic begin
    defer begin
    55
    defer end
     */

#### defer  推迟; 延期; 服从

  defer的思想类似于C++中的析构函数，不过Go语言中“析构”的不是对象，而是函数，defer就是用来添加函数结束时执行的语句。注意这里强调的是添加，而不是指定，因为不同于C++中的析构函数是静态的，Go中的defer是动态的。

  defer 语句用于延迟一个函数或者方法(或者当前所创建的匿名函数)的执行，它会在外围函数或者方法返回之前但是其返回值(如果有的话)计算之后执行。这样就可能在一个被延迟执行的函数内部修改函数的命名返回值(例如，使用赋值操作符给他们赋新值)。如果一个函数或者方法中有多个defer语句，它们会以LIFO(Last In First Out, 后进先出)的顺序执行。

  defer可以多次，这样形成一个defer栈，后defer的语句在函数返回时将先被调用。

  defer 语句最常用的用法是，保证使用完一个文件后将其成功关闭，或者将一个不再使用的通道关闭，或者捕获异常。

    package main

    import "fmt"

    func f_one()(result int) {
        defer func() {
            result++
        }()
        return 0
    }

    func f_two()(result int) {
        return 0
        defer func() {
            result++
        }()
        return 0
    }

    func main() {
        fmt.Println(f_one())
        fmt.Println(f_two())
    }
    /**
     * 输出结果
     * 1
     * 0
     */


  f_one() 函数返回1, 因为defer中添加了一个函数, 在函数返回前改变了命名返回值的值.

  如果我们的defer语句没有执行，那么defer的函数就不会添加，如果把上面的程序改成f_two(),函数就返回0了，因为还没来得及添加defer的东西，函数就返回了。

#### painc 恐慌, 惊慌; 大恐慌

  panic 是用来表示非常严重的不可恢复的错误。

  在Go语言中这是一个内置函数, 接收一个interface{} 类型的值(也就是任何值了)作为参数。panic的作用就像我们平常接触的异常。不过Go可没有try ... catch，所以，panic一般会导致程序挂掉（除非recover）。所以，Go语言中的异常，那真的是异常了。你可以试试，调用panic看看，程序立马挂掉，然后Go运行时会打印出调用栈。

  但是，关键的一点是，即使函数执行的时候panic了，函数不往下走了，运行时并不是立刻向上传递panic，而是到defer那，等defer的东西都跑完了，panic再向上传递。所以这时候 defer 有点类似 try-catch-finally 中的 finally。

  panic就是这么简单。抛出个真正意义上的异常。


#### recover  恢复; 弥补; 重新获得
  
  上面说到，panic的函数并不会立刻返回，而是先defer，再返回。这时候（defer的时候），如果有办法将panic捕获到，并阻止panic传递，那就异常的处理机制就完善了。

  Go语言提供了recover内置函数，前面提到，一旦panic，逻辑就会走到defer那，那我们就在defer那等着，调用recover函数将会捕获到当前的panic（如果有的话），被捕获到的panic就不会向上传递了，于是，世界恢复了和平。你可以干你想干的事情了。

  不过要注意的是，recover之后，逻辑并不会恢复到panic那个点去，函数还是会在defer之后返回。

 


#### 转载
    http://www.cnblogs.com/ghj1976/archive/2013/02/11/2910114.html