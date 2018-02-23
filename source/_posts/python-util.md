---
title: python_util
date: 2017-04-01 15:56:37
tags:
categories:
---



# 使用 assert 断言是学习 python 一个非常好的习惯, python assert 断言句语格式及用法很简单

# python assert 断言是声明其布尔值必须为真的判定,如果发生异常就说明表达示为假.
# 可以理解 assert 断言语句为 raise-if-not, 用来测试表示式, 其返回值为假, 就会触发异常

# assert 的异常参数, 其实就是在断言表达式后添加字符串信息, 用来解释断言并更好的知道是哪里出了问题
# assert expression [, arguments]
# assert 表达式 [, 参数]


try:
    assert 1==2, "1!=2"
except AssertionError:
    print 'AssertionError error'
except Exception:
    print "other error"


assert 1==1
