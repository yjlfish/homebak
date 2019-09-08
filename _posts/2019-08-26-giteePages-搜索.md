---
title: "giteePages-站内搜索"
excerpt: "giteePages-站内搜索"

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

giteePages-站内搜索


## Simple-Jekyll-Search参考

[官方](https://github.com/christian-fei/Simple-Jekyll-Search)

## 使用

添加在head.html

```html

<style>
   
    #search-container {
          max-width: 40em;
          padding: 0em;
          margin: 0em 0em 0em 12.5em;
          /*padding: 0em 0em 0em 1em*/

          border: 0px solid lightgrey;
    }
    #search-input {
      display: inline-block;
      padding: .5em;
      width: 100%;
      font-size: 0.8em;
      -webkit-box-sizing: border-box;
      -moz-box-sizing: border-box;
      box-sizing: border-box;
    }
  </style>

```

```html
     <div id="search-container" >
      
       <input type="text" id="search-input"  placeholder="搜索...">
       <ul id="results-container"></ul>
     </div>
 <script src="/simple-jekyll-search.min.js"></script>
 
 
 {%raw%}
 <script type="text/javascript">
       SimpleJekyllSearch({
           searchInput: document.getElementById('search-input'),
           resultsContainer: document.getElementById('results-container'),
           json: '/search.json',
           searchResultTemplate: '<li><i class="fa fa-envelope-o"></i><a href="{url}" title="{tags}">{title}</a></li>', // 文章列表模板
           noResultsText: '没有搜索到文章', // 无搜索数据提示语
           limit: 15, // 返回最大文章数
           fuzzy: false // 是否模糊匹配
       });
       smoothScroll.init({
         speed: 500, // Integer. How fast to complete the scroll in milliseconds
         easing: 'easeInOutCubic', // Easing pattern to use
         offset: 20, // Integer. How far to offset the scrolling anchor location in pixels
       });
     </script>
{%endraw%}
```
search.json设置
```html
 {%raw%}
 ---
 layout: null
 ---
 [
   {% for post in site.posts %}
     {
       "title"    : "{{ post.title | escape }}",
       "category" : "{{ post.category }}",
       "tags"     : "{{ post.tags | join: ', ' }}",
       "url"      : "{{ site.baseurl }}{{ post.url }}",
       "date"     : "{{ post.date }}"
     } {% unless forloop.last %},{% endunless %}
   {% endfor %}
 ]
 {%endraw%}
 
```




## 评论




