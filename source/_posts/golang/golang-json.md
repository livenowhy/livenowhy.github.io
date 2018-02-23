---
title: golang-json
date: 2016-12-20 09:07:45
tags:
categories:
---

#### golang json

	Go语言的json库:Go语言自带的JSON转换库为 encoding/json

	1.其中把对象转换为JSON的方法(函数)为json.Marshal(),函数原型:
	func Marshal(v interface{}) ([]byte, error) {}

	也就是说，这个函数接受任意类型的数据 v, 并转换为字节数组类型，返回值就是我们想要的JSON数据和一个错误代码;
	当转换成功的时候，这个错误代码为nil。
	在进行对象转换为JSON的过程中，会遵守如下几个原则:
	1.布尔型转换为JSON后仍然是布尔型, 如: trun —> true
	2.浮点型和整数型转换后为JSON里面的常规数字,如 1.23 —> 1.23
	3.字符串以UTF-8编码转换输出为Unicode字符集的字符串，特殊字符比如 < 将会被转义为 \u003c
	4.数组和切片被转换为JSON里面的数组,[]byte类被转换为base64编码后的字符串,slice的零值被转换为null
	5.结构体会转化为JSON对象，并且只有结构体里边以大写字母开头的可被导出的字段才会被转化输出，而这些可导出的字段会作为JSON对象的字符串索引
	6.转化一个map类型的数据结构时，该数据的类型必须是map[string]T (T可以是encoding/json包支持的任意数据类型)

	2.把JSON转换成对象的方法(函数)为json.Unmarshal(),函数原型如下:
	func Unmarshal(data []byte, v interface{}) error {}
	    这个函数会把传入的data作为一个JSON来进行解析，解析后的数据存储在参数 v 中。这个参数 v 也是任意类型的参数(但一定是一个类型的指针),原因是我们在使用此函数进行JSON解析的时候，这个函数不知道这个传入参数的具体类型，所以它需要接收所有的类型。
	    那么，在进行解析的时候，如果JSON和对象的结构不对口会发生什么呢，这就需要解析函数json.Unmarshal()遵循如下准则:
	1.json.Unmarshal() 函数会根据一个约定的顺序查找目标结构中的字段，如果找到一个即发生匹配。
	那什么是找到了呢？关于”找到了"又有如下的规则：假设一个JSON对象有个名为"Foo"的索引，要将"Foo"所对应的值填充到目标结构体的目标字段上，json.Unmarshal() 将会遵循如下顺序进行查找匹配:
	a.一个包含 Foo 标签的字段
	b.一个名为 Foo 的字段
	c.一个名为Foo 或者Foo 或者除了首字母其他字母不区分大小写的名为Foo 的字段。这些字段在类型声明中必须都是以大写字母开头、可被导出的字段。
	注意:如果JSON中的字段在Go目标类型中不存在，json.Unmarshal() 函数在解码过程中会丢弃该字段。
	当JSON 的结构是未知的时候，会遵循如下规则:
	a.JSON中的布尔值将会转换为Go中的bool类型
	b.数值会被转换为Go中的float64类型
	c.字符串转换后还是string类型;null值会转换为nil
	d.JSON数组会转换为[]interface{} 类型
	e.JSON对象会转换为map[string]interface{}类型
	注意:在Go的标准库encoding/json包中，允许使用map[string]interface{}和[]interface{}类型的值来分别存放未知结构的JSON对象或数组

	import "fmt"
	import "encoding/json"

	/** 假设我们有如下一个类(结构体)student 及其一个实例对象st */
	type Student struct {
	   Name     string
	   Age      int
	   Guake    bool
	   Classes  []string
	   Prince   float32
	}

	/** 现在需要把这个类的一个对象转换为JSON格式 */

	func (s * Student)ShowStu() {
	   fmt.Println("show Student:")
	   fmt.Println(s.Name)
	   fmt.Println(s.Age)
	   fmt.Println(s.Guake)
	   fmt.Println(s.Prince)
	   fmt.Println(s.Classes)
	}

	func main() {
	   st := &Student{
	   "Xiao Ming",
	   16,
	   true,
	   []string{"Math", "English", "Chinese"},
	   9.99,
	   }

	   fmt.Println("before JSON encoding .... ")
	   st.ShowStu()

	   b, err := json.Marshal(st)
	   if err != nil {
	      fmt.Println("encoding faild")
	   } else {
	      fmt.Println("encoded data")
	      fmt.Println(b)
	      fmt.Println(string(b))
	   }

	   sts := &Student{}
	   sts.ShowStu()
	   err = json.Unmarshal([]byte(b), &sts)
	   if err != nil{
	      fmt.Println("Unmarshal faild")
	   } else {
	      fmt.Println("Unmarshal ok")
	      sts.ShowStu()
	   }
	}