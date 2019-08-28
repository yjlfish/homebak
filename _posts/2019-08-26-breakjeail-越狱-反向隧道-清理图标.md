---
title: "breakjeail-越狱-反向隧道-清理图标"
excerpt: "breakjeail-越狱-反向隧道-清理图标"

categories:
  - 越狱
tags:
  - 边界工具
  - 越狱

toc: true
toc_label: 目录
toc_sticky: true
secretpage: false
scrollgrace: true
last_modified_at: 2019-08-26T15:12:19-04:00
---

breakjeail-越狱-反向隧道

## 前提
越狱手机


## 使用
爱思助手安装，工具选择开启反向隧道
本地用iterm2 连接ssh 

## 命令
```shell
ssh root@127.0.0.1 -p1025
密码alpine
```
清理图标缓存
```shell
uicache --all  【ios12】
uicache  【ios8】
```

## 评论




