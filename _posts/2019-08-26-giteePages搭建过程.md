---
title: "giteePages搭建过程"
excerpt: "giteePages搭建过程"

categories:
  - 建站
tags:
  - giteepages
  - 静态网站

toc: true
toc_label: 目录
toc_sticky: true
secretpage: false
scrollgrace: true
last_modified_at: 2019-08-26T15:12:19-04:00
---

giteePages搭建过程


## jekyll参考

[jekyll中文文档1](https://www.jekyll.com.cn/docs/)

[jekyll中文文档2](http://jekyllcn.com/docs/home/)

[jeyll英文文档](https://jekyllrb.com/docs/)

选择jekyll 、haxos搭建本地环境

安装ruby环境（macos）

ruby版本需要高于2.4.0 (最好在挂v环境)

```shell
xcode-select --install
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

brew install ruby

export PATH=/usr/local/opt/ruby/bin:$PATH

```

前往 ~/.bash_profile 我的配置

```shell

# Setting PATH for Python 3.5
# The orginal version is saved in .bash_profile.pysave
PATH="/Library/Frameworks/Python.framework/Versions/3.5/bin:${PATH}"
export PATH
#enables colorin the terminal bash shell export

CLICOLOR=1

#sets up thecolor scheme for list export

LSCOLORS=gxfxcxdxbxegedabagacad

#sets up theprompt color (currently a green similar to linux terminal)

exportPS1='
\033[01;32m
\u@\h
\033[00m
:
\033[01;36m
\w
\033[00m
\$ '

#enables colorfor iTerm

exportTERM=xterm-color
alias sed="gsed"
export SCALA_HOME=/usr/local/share/scala
export PATH=$SCALA_HOME/bin:$PATH
export NODE_HOME=/usr/local/node-v6.9.1
export PATH=$NODE_HOME/bin:$PATH
export PATH=$PATH:/usr/local/mysql-5.7.13-osx10.11-x86_64/bin
export LC_CTYPE=en_US.UTF-8
export LC_ALL=en_US.UTF-8
JAVA_HOME='/Library/Java/JavaVirtualMachines/jdk1.8.0_121.jdk/Contents/Home'
export JAVA_HOME
export NAMESRV_ADDR=localhost:9876
export M2_HOME=/Users/yujianlong/Movies/apache-maven-3.5.4
export PATH=/usr/local/bin:/usr/local/opt/ruby/bin:$PATH:$M2_HOME/bin:/Users/yujianlong/.gem/ruby/2.6.0/bin

```

执行 `source  ~/.bash_profile` 必要的话重启电脑

```shell
which ruby
ruby -v
brew install rbenv
rbenv init
curl -fsSL https://github.com/rbenv/rbenv-installer/raw/master/bin/rbenv-doctor | bash

重启终端

rbenv install 2.6.3
rbenv global 2.6.3
ruby -v
ruby 2.6.3p62 (2019-04-16 revision 67580)
```
安装jekyll

```shell
gem install --user-install bundler jekyll

export PATH=$HOME/.gem/ruby/X.X.0/bin:$PATH

gem env
```

以上参考[Jekyll on macOS](https://www.jekyll.com.cn/docs/installation/macos/)







## 主题选择

[minimal-mistakes](https://github.com/mmistakes/minimal-mistakes)

[unifreak](https://github.com/UniFreak/unifreak.github.io)

[主题网站1](http://jekyllthemes.org/)

[主题网站2](https://jekyllthemes.io/)

[主题文档](https://jekyllrb.com/docs/themes/)

[简历主题1](https://github.com/streetturtle/jekyll-cv-crafter)


[wu-kan主题](https://github.com/wu-kan/wu-kan.github.io)

[leopardpan主题](https://github.com/leopardpan/leopardpan.github.io)







## 运行 命令
```shell
bundle exec jekyll serve

JEKYLL_GITHUB_TOKEN=8902570226ab4fd7e00616dbf73feef53f433e37 bundle exec jekyll serve -w -P8080



```




## 评论




