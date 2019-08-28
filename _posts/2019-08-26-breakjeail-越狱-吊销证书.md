---
title: "impactor注销证书"
excerpt: "breakjeail-越狱-impactor注销证书"

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

breakjeail-越狱-impactor注销证书

## 说明
本工具适用于完整越狱 而不是完美越狱，完美越狱只支持到ios8

## 下载impactor

* [imapactor0.9.42旧版本](https://cache.saurik.com/impactor/mac/Impactor_0.9.42.dmg) 旧版本用于吊销证书
* [imapactor0.9.43旧版本-windows](https://cache.saurik.com/impactor/win/Impactor_0.9.43.zip) 旧版本用于吊销证书
* [imapactor0.9.52新版本](https://cache.saurik.com/impactor/mac/Impactor_0.9.52.dmg) 旧版本用于安装

## 使用
1. 用旧版本0.9.42吊销证书
点击xcode>>revoke certificate
弹出输入苹果账号 输入完要输入密码
该密码是进入[苹果网站](https://appleid.apple.com/)后设置的应用密码，不是appstore的密码
账号是国内的二次认证账号所以需要输入应用密码,输入完成后提示吊销了几个证书，为避免出现异常，把所有
试用的苹果账号一一尝试一遍。
2. 重新启动mac本
3. 用新版本0.9.52 device>>install package 选择[uncover](https://github.com/pwn20wndstuff/Undecimus/releases) 或者[chimera](https://chimera.sh/)的安装包

举例安装地址[uncover3.5.6](https://github.com/pwn20wndstuff/Undecimus/releases/download/v3.5.6/Undecimus-v3.5.6.ipa)
[chimera](https://chimera.sh/downloads/ios/1.3.6-12.0-12.4.ipa)
4. 安装成功后在手机上看到图标，回到通用 信任证书 回到应用点击breakjeail即可重新越狱
5. 有时候遇到证书过期，但是通用里也找不到对应证书，应用又删除不掉，可以尝试以上步骤重新安装，但是安装的证书只有7天有效期，必须续签，可以查看其它博文
寻找续签工具reprovision的用法
6. 有时候需要把越狱手机还原回未越狱状态，可以在uncover中 设置，其它的选项全部禁用 启用icon和rootstore(记不清选项了，大意是回收图标和所有安装的插件)
，可以寻找相关博客。


## 评论




