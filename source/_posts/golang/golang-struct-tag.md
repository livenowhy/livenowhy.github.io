---
title: golang-struct-tag
date: 2016-12-08 09:51:27
tags: [golang, struct]
categories: [golang]
---



## struct 中的 tag (golang)


  在 go 的 struct中,除了变量名和类型之外,还可以选择性的增加一些tag; 
  tag可以在类型的后面,用双引号(double quote)或重音(backquote/grave accent)表示的字符串.
  这些符号能被用来做文档或重要的标签。
  tag里面的内容在正常编程中没有作用。只有在使用反射的时候才有作用。
  反射的包可以让我们在运行时获取到变量的类型，属性以及方法。
  比如reflect.TypeOf()就可以返回一个变量的类型。
  如果是一个struct类型，可以按照每一个变量索引，来查询每一个的tag。
 
    package main
    
    import (
        "fmt"
        "reflect"
    )
    
    type Person struct {
        Name string `person name`
        Age int `person age`
    }
    
    func main() {
        pn := Person{Name: "test-person", Age: 12}
    
        var reflectType reflect.Type = reflect.TypeOf(pn)
    
        var field reflect.StructField
    
        for i := 0; i < 2; i++ {
            field = reflectType.Field(i)
            fmt.Println(field.Tag)
            fmt.Println(field.Type)
            fmt.Println(field.Name)
        }
    }
    
    // 输出
    //person name
    //string
    //Name
    //person age
    //int
    //Age
