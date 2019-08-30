---
title: "giteePages-cydia-私有cydia越狱源-搭建过程"
excerpt: "giteePages-cydia-私有cydia越狱源-搭建过程"

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

giteePages-cydia-私有cydia越狱源-搭建过程

##前言
越狱带来的好处很多，用了很多越狱源，感觉不错，萌生了为什么不能自己搭建一个自己用的越狱源呢?
于是从github取经，自己做的越狱源有缺陷，有些能下载，有些下载不能安装成功，还需要改进，先记录一下搭建的收获吧。

## 参考

https://github.com/supermamon/Reposi3
https://github.com/supermamon/repo/tree/gh-pages

## 简要说明
第一个是github的越狱源搭建模板  
首先下载下来 或者fork模板  
更名成自己的仓库名 https://username.github.io/cydia 以便开启github pages  
编辑Release文件 类似下边这样  
```
Origin: YJLFISH
Label: YJLFISH
Suite: stable
Version: 1.0
Codename: ios
Architectures: iphoneos-arm
Components: main
Description: YJLFISH's public repo.
```
编辑repo.xml 生成步骤在java中 主要编辑<packages></packages>中间的部分，填写包名  

几个xml的生成主要是 
```xml
info.xml.

<package>
    <id>com.supermamon.oldpackage</id>
    <name>Old Package</name>
    <version>1.0.0-1</version>
    <compatibility>
        <firmware>
            <miniOS>5.0</miniOS>
            <maxiOS>7.0</maxiOS>
            <otherVersions>unsupported</otherVersions>
            <!--
            for otherVersions, you can put either unsupported or unconfirmed
            -->
        </firmware>
    </compatibility>
    <dependencies></dependencies>
    <descriptionlist>
        <description>This is an old package. Requires iOS 7 and below..</description>
    </descriptionlist>
    <screenshots></screenshots>
    <changelog>
        <change>Initial release</change>
    </changelog>
    <links></links>
</package>
changelog.xml.

<changelog>
    <changes>
        <version>1.0.0-1</version>
        <change>Initial release</change>
    </changes>
</changelog>

```




## 我的执行步骤
1. 导出手机deb文件 （导出方式是安装cydown）放到debs目录  
2. 执行命令生成package文件
3. java运行代码
pom 文件引入hutools  
全部代码基于一个文件package文件
getXml 主要生成repo.xml <packages></packages>中间的部分 拷贝其中即可  
getPV 主要生成各个包目录和目录下的 changelog.xml 和info.xml文件  
生成之后 拷贝到 depictions目录中  
生成钱删除所有看似包的目录  
可以着重看我的仓库  
4. 本地化一些文字
```java
package cn.stylefeng.guns.config;

import cn.hutool.core.io.FileUtil;
import cn.hutool.core.io.IoUtil;
import cn.hutool.core.text.StrFormatter;
import com.alibaba.fastjson.util.IOUtils;
import org.apache.commons.lang3.StringUtils;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * @author yujianlong
 * @create 2019-08-19 18:45
 **/
public class ReadPack {
	public static void getXml(Path debPath) throws IOException {
		List<String> datas = Files.readAllLines(debPath);

		datas.stream().forEach(
				line->{
//					if (!StringUtils.isBlank(line)) {
//						System.out.println(line);
//					}

					if (line.startsWith("Package:")) {
						System.out.println("<package>"+line.split(":")[1].trim()+"</package>");
					}
				}

		);
	}

	private static String xmlinfo = "<package>\n" +
			"\t<id>{}</id>\n" +
			"\t<name>{}</name>\n" +
			"\t<version>{}</version>\n" +
			"\t<compatibility>\n" +
			"\t\t<firmware>\n" +
			"\t\t\t<maxiOS>12.2</maxiOS>\n" +
			"\t\t\t<otherVersions>unsupported</otherVersions>\n" +
			"\t\t\t<!--\n" +
			"\t\t\tfor otherVersions, you can put either unsupported or unconfirmed\n" +
			"\t\t\t-->\n" +
			"\t\t</firmware>\n" +
			"\t</compatibility>\n" +
			"\t<dependencies></dependencies>\n" +
			"\t<descriptionlist>\n" +
			"\t\t<description>{}</description>\n" +
			"\t</descriptionlist>\n" +
			"\t<screenshots></screenshots>\n" +
			"\t<changelog>\n" +
			"\t\t<change>初始化</change>\n" +
			"\t</changelog>\n" +
			"\t<links></links>\n" +
			"</package>";


	private static String xmlchl = "<changelog>\n" +
			"\t<changes>\n" +
			"\t\t<version>{}</version>\n" +
			"\t\t<change>初始化</change>\n" +
			"\t</changes>\n" +
			"</changelog>\n";


	public static void getPV(Path debPath) throws IOException {
		List<String> datas = Files.readAllLines(debPath);
		HashMap<String, String> pvMap = new HashMap<>();

		String baseDir = "/Users/yujianlong/Downloads/pkdir/";

		String pack="";
		String ver="";
		String name="";
		for (int i = 0; i < datas.size(); i++) {
			String line = datas.get(i);
			if (line.startsWith("Package:")) {
				pack = line.split(":")[1].trim();
			}
			if (line.startsWith("Version:")) {
				ver = line.split(":")[1].trim();
			}
			if (line.startsWith("Name:")) {
				name = line.split(":")[1].trim();
			}

			if (StringUtils.isBlank(line)&&StringUtils.isNotEmpty(pack)&&StringUtils.isNotEmpty(ver)&&StringUtils.isNotEmpty(name)) {
				System.out.println(pack+":"+ver+":"+name);

				String ditnew = baseDir + pack;
				FileUtil.mkdir(ditnew);
				//新建文件夹

				String xmlinfo1=StrFormatter.format(xmlinfo, pack, name, ver, name);
				String xmlchl1=StrFormatter.format(xmlchl,ver);
//				System.out.println(xmlinfo1);
				FileUtil.writeString(xmlinfo1, ditnew + "/info.xml","utf-8");
				FileUtil.writeString(xmlchl1, ditnew + "/changelog.xml","utf-8");
				//写入xml

//				break;
			}



		}

	}



	public static void main(String[] args) throws IOException {
		Path debPath = Paths.get("/Users/yujianlong/Downloads/myrepo/Packages");
		List<String> datas = Files.readAllLines(debPath);
		getPV(debPath);
//		getXml(debPath);



	}
}

```

## deb导出或者三方获取deb
cydia点击变更 右上角的文件夹  管理 或者wifi-sharing 或者dropbox 推荐wifi 点开启，mac上连接提示的网址  
即可导出  备份路径在 /var/mobile/Documents/CyDown/  
也可以 使用cydownload 链接: https://pan.baidu.com/s/1B4MMSn_Zj2W_iiMKV49_GA 提取码: 5fxu  
输入越狱源 搜索软件名 即可下载deb 文件 参考[用Cydownload下载deb插件教程](https://weibo.com/ttarticle/p/show?id=2309404344401265622075)



也可以 访问[ios-repo-updates](https://www.ios-repo-updates.com/search/)  
这里有很多最新越狱源的展示 最新包 很好很强大 

## 重要的一部 生成package文件
终端执行(为了快速，我挂v了)
```shell
export http_proxy=http://127.0.0.1:1087;                               
export https_proxy=http://127.0.0.1:1087;

brew install dpkg 
dpkg --help

brew install gpg

gpg --help
sudo dpkg-scanpackages debs /dev/null > Packages
tar zcvf Packages.gz Packages
bzip2 -k Packages Packages.bz2
gpg --gen-key
gpg -abs -r "你刚才的密钥名字" -o Release.gpg Release
```
以上是我曾经的步骤参考[Cydia源局域网化](https://my.oschina.net/swustyc/blog/852456), [在局域网搭建自己的Cydia源](https://bbs.feng.com/read-htm-tid-8052646.html)
github参考中的步骤是进入deb目录后执行:
```shell
sudo dpkg-scanpackages -m ./debs > Packages
bzip2 Packages

```

## 我搭建的
[myrepo](https://github.com/yujianlong/myrepo)



## 评论




