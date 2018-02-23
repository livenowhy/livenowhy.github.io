---
title: git
date: 2016-12-16 13:36:44
tags: [git]
categories: [tools, git]
---

#### git 删除分支和删除文件夹

####  删除分支

  `1` 查看所有分支
     
     git branch -a
   
  `2` 删除HEAD分支
    
    git push origin --delete HEAD 

####  删除文件夹
  
  `1` 删除 temp 文件夹及其下所有的文件
    
    git rm temp -r -f
    
  `2` 同步删除操作到远程分支(commit)
    
    git commit -m "delete raindow"
    
  `3` 提交分支
    
    git push origin master
    
    删除文件完成
  
 


