---
title: how-use-hexo
date: 2016-12-04 14:06:23
tags: [tags, hexo]
categories: hexo
---

## how to use hexo

#### 配置环境
  
  `1` 安装Node: 到Node.js官网下载相应平台的最新版本，一路安装即可
  `2` 安装Git客户端; 申请GitHub账号

#### 安装Hexo
  
  首先创建一个文件夹,如blog,用于存放hexo的配置文件,然后进入 blog 里安装Hexo。

  执行如下命令安装Hexo：

    sudo npm install -g hexo

  初始化然后，执行init命令初始化hexo,命令：

    hexo init

  至此，全部安装工作已经完成, blog 就是你的博客根目录，所有的操作都在里面进行。

  生成静态页面

    hexo generate (hexo g 也可以)

  本地启动,启动本地服务,进行文章预览调试,命令：

    hexo server

  浏览器输入http://localhost:4000

#### 配置Github

  建立Repository

  建立与你用户名对应的仓库, 仓库名必须为 __[your_user_name.github.io]__,固定写法
  然后建立关联,我的blog在本地/Users/leopard/blog, blog是我之前建的东西也全在这里面，有：

    _config.yml  node_modules  public  source  db.json  package.json  scaffolds  themes

  现在我们需要修改 _config.yml 文件,来建立关联:
    
    vi _config.yml
  
  文件最好添加如下内容:
    
    deploy:
      type: git
      repo: git@github.com:livenowhy/livenowhy.github.io.git
      branch: master
      
      其中如果没有配置SSH Keys, 
      repo:https://github.com/livenowhy/livenowhy.github.io.git (两种协议, 对应两种格式)
      

  然后执行命令:
    
    npm install hexo-deployer-git --save
    
  对于, type:有些hexo版本是github; repository 最后面的后缀也不一样, 低版本是 github.com.git
  
  然后,执行配置命令:
    
    hexo deploy
    
  然后再浏览器中输入 https://livenowhy.github.io/ 就行了, 
  我的github的账户叫livenowhy,把这个改成你github的账户名就行了


#### 部署步骤
  
  每次部署的步骤,可按以下三步来进行:
    
    hexo clean
    hexo generate    (生成静态页面至public目录)
    hexo deploy      将.deploy目录部署到GitHub
    
  常用命令:
  
    hexo new "postName"          # 新建文章
    hexo new page "pageName"     # 新建页面
    hexo server                  # 开启预览访问端口(默认端口4000, 'ctrl + c'关闭server)
    
    hexo help                    # 查看帮助
    hexo version                 # 查看Hexo的版本
    
    
#### 修改头像
  
  路径 ./blog/themes/yilia, ls 你可以看到
  
    Gruntfile.js  _config.yml  package.json  README.md  layout  source
    
    vim _config.yml
    进去,找到 #你的头像url avatar: 后接一个URL就行了，头像就修改成功了

    
#### 作者名字
    
    vi _config.yml    文件

  `作者名字` author 字段

####  修改主题 -- 使用Next主题让站点更酷炫

  `1`  使用
    
    $ cd your-hexo-site
    $ git clone https://github.com/iissnan/hexo-theme-next themes/next
    
    从Next的Gihub仓库中获取最新版本
    
  `2`  启用
  
    _config.yml配置项theme:
    
    
    # Extensions
    ## Plugins: http://hexo.io/plugins/
    ## Themes: http://hexo.io/themes/
    theme: next
    
    theme: 后面接你自己的主题名字就行了,然后分别执行
    
    验证是否启用
    $ hexo s --debug
    
  
  
#### 文章永久链接
    
    默认文章链结是以: http://xxx.com/2016/07/06/your-title/ 的格式的,
    
    修改全局配置: _config.yml 文件
    permalink: posts/:category/:year-:month-:day-:title.html
    
    
#### hexo的目录结构及作用



    全局配置文件_config.yml

  `1` 主目录结构

    |-- _config.yml
    |-- package.json
    |-- scaffolds
    |-- scripts
    |-- source
        |-- _drafts
        |-- _posts
    |-- themes
    
    
    _config.yml: 全局配置文件,网站的很多信息都在这里配置,诸如网站名称,副标题,描述,作者,语言,主题,部署等等参数.
    
    
    scaffolds: scaffolds 是"脚手架、骨架"的意思,当新建一篇文章(hexo new 'title') 的时候, 
    hexo是根据这个目录下的文件进行构建的(基本不用关心)
    
    package.json: hexo框架的参数,如果不小心把它删掉了,没关系,新建一个文件,将内容写入文件,保存。
    
    scripts: 脚本目录,此目录下的JavaScript文件会被自动执行。
    
    source: 新建的文章都是在保存在这个目录下的, 有两个子目录: _drafts, _posts. 需要新建的博文都放在_posts目录下.
    
    _posts 目录下是一个个 markdown 文件. 你应该可以看到一个 hello-world.md 的文件,文章就在这个文件中编辑。
    _posts目录下的md文件,会被编译成html文件, 放到public(编译之后才会存在)文件夹下,
    可以在_posts目录下建立不同的二级目录文件用于存放不同类型的文章,如linux、docker、golang、Python ...
    
    themes: 网站主题目录，hexo有非常好的主题拓展,支持的主题也很丰富。该目录下,每一个子目录就是一个主题.
    
    
    里面的参数基本上是固定的,如下：
    
    {
        "name": "hexo-site",
        "version": "0.0.0",
        "private": true,
        "hexo": {
            "version": "3.2.2"
        },
        "dependencies": {
        ... ... 
        }
    }

    
