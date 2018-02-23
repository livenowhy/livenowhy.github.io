---
title: golang-read-file
date: 2016-12-07 08:58:21
tags: [golang, file]
categories: [golang]
---

#### golang 文件读取

    package main
    
    import (
        "fmt"
        "os"
        "io/ioutil"
        "log"
        "bufio"
        "io"
    )
    
    
    // 小文件推荐一次性读取,这样程序更简单,而且速度最快。
    func ReadAll(filePath string) error{
        fp, err := os.Open(filePath)
        if err != nil {
            log.Fatal(err)
            return err
        }
        b, err := ioutil.ReadAll(fp)
        if err != nil {
            log.Fatal(err)
            return err
        }
        fmt.Printf(string(b))
        return nil
    }
    
    // 更简单方法
    func ReadAllOne(filePath string) error {
    
        b, err := ioutil.ReadFile(filePath)
        if err != nil {
            log.Fatal(err)
            return err
        }
        log.Println(string(b))
        return nil
    }
    
    
    // 分块读取
    func ProcessBlock(line []byte) {
        os.Stdout.Write(line)
    }
    
    func ReadBlock(filePath string, bufSize int, hookfn func([]byte)) error {
        fp, err := os.Open(filePath)
        if err != nil {
            log.Fatal(err)
            return err
        }
        defer fp.Close()
    
        buf := make([]byte, bufSize) // 一次读取多少个字节
        bfRd := bufio.NewReader(fp)
    
        for {
            n, err := bfRd.Read(buf)
            hookfn(buf[:n])  // n 是成功读取字节数
    
            if err != nil {  //遇到任何错误立即返回，并忽略 EOF 错误信息
                if err == io.EOF {
                    return nil
                }
    
                return err
    
            }
        }
    
        return nil
    }
    
    // 逐行读取
    func ReadLine(filePath string, hookfun func([]byte)) error {
        fp, err := os.Open(filePath)
    
        if err != nil {
            log.Fatal(err)
            return err
        }
        defer fp.Close()
    
        bfRD := bufio.NewReader(fp)
    
        for {
            line, err := bfRD.ReadBytes('\n') // 读取到 '\n' 停止,
            fmt.Println("------------->")
            hookfun(line) //放在错误处理前面，即使发生错误，也会处理已经读取到的数据。
            if err != nil {  //遇到任何错误立即返回，并忽略 EOF 错误信息
                if err == io.EOF {
                    return nil
                }
                return err
            }
        }
        return nil
    }
    
    func main() {
    
        //ReadAll("/Users/lzp/Desktop/WorkGo/src/gogit/file/test.log")
    
        //ReadAllOne("/Users/lzp/Desktop/WorkGo/src/gogit/file/test.log")
    
        //ReadBlock("/Users/lzp/Desktop/WorkGo/src/gogit/file/test.log", 23, ProcessBlock)
        ReadLine("/Users/lzp/Desktop/WorkGo/src/gogit/file/test.log", ProcessBlock)
    
    }
