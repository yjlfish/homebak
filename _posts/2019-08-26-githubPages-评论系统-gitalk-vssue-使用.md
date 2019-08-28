---
title: "githubPages评论系统gitalk&vssue使用"
excerpt: "githubPages评论系统gitalk&vssue使用"

categories:
  - 建站
tags:
  - githubpages
  - 静态网站
  - 评论系统

toc: true
toc_label: 目录
toc_sticky: true
secretpage: false
scrollgrace: true
last_modified_at: 2019-08-26T15:12:19-04:00
---

githubPages评论系统gitalk&vssue使用

## vssue使用说明

[vssue官网和使用方式](https://vssue.js.org/zh/guide/)
里边有各种配置，使用方法
以下是我的用法
```html


<link rel="stylesheet" href="https://unpkg.com/vssue/dist/vssue.min.css">
<script src="https://unpkg.com/vue/dist/vue.runtime.min.js"></script>
 <script src="https://unpkg.com/vssue/dist/vssue.github.min.js"></script>
 <style>


.markdown-body {
    -ms-text-size-adjust: 100%;
    -webkit-text-size-adjust: 100%;
    color: #ff9215;
    font-family: -apple-system,BlinkMacSystemFont,Segoe UI,Helvetica,Arial,sans-serif,Apple Color Emoji,Segoe UI Emoji,Segoe UI Symbol;
    font-size: 16px;
    line-height: 1.5;
    word-wrap: break-word;
}
.vssue .vssue-pagination .vssue-pagination-select {
    outline: none;
    background-color: #22231f;
    border: 1px solid #9adbbe;
}
.vssue-new-comment-body > textarea {
  color: #ff9215;
}
</style>
<div id="vssue"></div>
<script>
    new Vue({
      el: '#vssue',

      render: h => h('Vssue', {
        props: {
          // 在这里设置当前页面对应的 Issue 标题
          prefix: '{{page.categories[0]}}',
          labels: ['{{ page.tags | join: "','" }}'],
          title: '{{page.title}}',

          // 在这里设置你使用的平台的 OAuth App 配置
          options: {
            owner: '{{site.git_owner}}',
            repo: '{{site.git_repo}}',
            clientId: '{{site.git_clientID}}',
            admins: ['{{ site.git_admin | join: "','" }}'],
            clientSecret: '{{site.git_clientSecret}}', // 只有在使用某些平台时需要
          },
        }
      })
    })
  </script>

```

以上只需要封装成一个html include到default或者footer中即可

vssue比gitalk好的是可以支持国内gitee 可以删除评论等操作，其用法和gitalk差不多
gitalk只支持github

## gitalk使用说明
[gitalk官网和使用方式](https://github.com/gitalk/gitalk/blob/master/readme-cn.md)
我的用法

```html

<style>
.gt-container .gt-header-textarea {
  padding: 0.75em;
  display: block;
  -webkit-box-sizing: border-box;
          box-sizing: border-box;
  width: 100%;
  min-height: 5.125em;
  max-height: 15em;
  border-radius: 5px;
  border: 1px solid rgba(0,0,0,0.1);
  font-size: 0.875em;
  word-wrap: break-word;
  resize: vertical;
  background-color: #f6f6f6;
  outline: none;
  -webkit-transition: all 0.25s ease;
  transition: all 0.25s ease;
  color:red;
}
</style>
<div id="gitalk-container"></div>
<script type="text/javascript">
    var gitalk = new Gitalk({
                    title: '{{page.title}}',
                    id: '{{page.title}}',
                    clientID: '{{site.git_clientID}}', // GitHub Application Client ID
                    clientSecret: '{{site.git_clientSecret}}', // GitHub Application Client Secret
                    repo: '{{site.git_repo}}',     // 存放评论的仓库
                    owner: '{{site.git_owner}}',          // 仓库的创建者，
                    admin: ['{{ site.git_admin | join: "','" }}'],        // 如果仓库有多个人可以操作，那么在这里以数组形式写出
                    id: location.pathname,      // 用于标记评论是哪个页面的，确保唯一，并且长度小于50
                    distractionFreeMode: true
});
gitalk.render('gitalk-container'); 
window.onhashchange = function(event){
      if(event.newURL.split('?')[0] !== event.oldURL .split('?')[0]) {
        location.reload()
      }
    }
</script>



```

## 变量说明
可查看jekyll和liquid的用法
大部分变量都是md文件和_config.yml文件的配置

具体参数参考
[创建一个新的-oauth-app](https://vssue.js.org/zh/guide/github.html#%E5%88%9B%E5%BB%BA%E4%B8%80%E4%B8%AA%E6%96%B0%E7%9A%84-oauth-app)
[Gitee 第三方应用](https://vssue.js.org/zh/guide/gitee.html)

## 评论




