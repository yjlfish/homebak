---
title: "githubPages平滑锚点scroll"
excerpt: "githubPages平滑锚点scroll"

categories:
  - 建站
tags:
  - githubpages
  - 静态网站

toc: true
toc_label: 目录
toc_sticky: true
secretpage: false
scrollgrace: true
last_modified_at: 2019-08-26T15:12:19-04:00
---

githubPages平滑锚点scroll  


[常用mac工具]({{ "/内网穿透/常用mac工具/" | relative_url }}){: .btn .btn--success .btn--large}


## 修改default.html
page.scrollgrace是post文件加的，对于特殊链接会跳转，所以需要平滑滚动到锚点  
步骤一 去掉href为空 增加属性 href1
步骤二 对li 下的 a点击需要处理 主要是用animate方法



{% raw %}

```js
    {% if page.scrollgrace==true %}
      <script type="text/javascript" src="{{ '/verify-master/js/jquery.min.js' | relative_url }}" ></script>
      <script>
         var aTags = document.querySelectorAll('.toc__menu  a')
         for (var i = 0; i < aTags.length; i++) {
           aTags[i].setAttribute('href1',aTags[i].getAttribute("href"));
           aTags[i].setAttribute('href','');
         }
        function goToEle(e) {
          
            var href = $(this).attr("href1");
             var pos = $(href).offset().top;
             
             $("html,body").animate({scrollTop: pos}, 500); 
             return false;
           }

        $(document).on("click",".toc__menu li a",goToEle);
    </script>
    {%endif%}
```
{% endraw %}



## 评论




