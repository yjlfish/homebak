---
title: "giteePages-特殊使用语法"
excerpt: "giteePages-特殊使用语法"

categories:
  - 建站
tags:
  - giteepages
  - 静态网站

toc: true
toc_label: 目录
toc_sticky: true
secretpage: true
scrollgrace: true
last_modified_at: 2019-08-26T15:12:19-04:00
---

giteePages-特殊使用语法

## 插入音频视频


```html

<iframe src="http://music.163.com/song/media/outer/url?id=27759600.mp3 " frameborder="0" webkitAllowFullScreen mozallowfullscreen allowFullScreen></iframe>

<iframe src="http://music.163.com/song/media/outer/url?id=27759600.mp3 " frameborder="0" marginwidth="1px" marginheight="40px"  webkitAllowFullScreen mozallowfullscreen allowFullScreen></iframe>

```

```html
<iframe src="XXX" width="90%" height="600px" frameborder="0" allowfullscreen></iframe>
```

## markdown语法

插入代码
tab键上方的按钮 右侧输入yaml html markdown liquid ruby java js css

插入序列
```markdown
- [x] Finish my changes

 - [ ] 任务时间管理驱动生活
     * - [ ] things
     * - [ ] 2Do
     * - [ ] omnifocus
 - [ ] 任务时间管理驱动生活
     * - [ ] things
     * - [ ] 2Do
     * - [ ] omnifocus
 - [ ] 任务时间管理驱动生活
     * - [ ] things
          * - [ ] 2Do
          * - [ ] omnifocus 
     * - [ ] 2Do
     * - [ ] omnifocus 

```


禁止搜索

```yaml
search: false 

```


## liquid jekyll 语法

高亮显示代码和行号

{% raw %}

{% highlight ruby linenos %}
def foo
  puts 'foo'
end
{% endhighlight %}

{% endraw %}

ruby 可以改为java 等

连接其他markdown文件
{% raw %}
{% link _collection/name-of-document.md %}

{% post_url 2010-07-21-name-of-post %}
连接_posts子目录的文件
{% post_url /subdir/2010-07-21-name-of-post %}

{% endraw %}

添加按钮
{% raw %}
Install the Theme{: .btn .btn--success .btn--large}
{% endraw %}






## 评论




