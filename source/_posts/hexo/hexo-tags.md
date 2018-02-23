---
title: hexo-tags
date: 2016-12-05 19:01:42
tags: [tags, hexo]
categories: hexo
---


##  hexo 下的分类和表签无法显示, 怎么解决

#### 步骤一
  新建一个页面,命名为 tags :
    
    $ hexo new page "tags"

#### 步骤二
  
  编辑刚新建的页面，将页面的类型设置为 tags, 主题将自动为这个页面显示标签云,页面内容如下:
  
    ---
    title: tags
    date: 2016-12-05 18:53:28
    type: "tags"
    ---


  注意: 如果有启用多说 或者 Disqus 评论, 默认页面也会带有评论.需要关闭的话,
  请添加字段 comments 并将值设置为 false, 如:

    ---
    title: tags
    date: 2016-12-05 18:53:28
    type: "tags"
    comments: false
    ---


## 步骤三
在菜单中添加链接。编辑 主题配置文件 ，添加 tags 到 menu 中，如下: