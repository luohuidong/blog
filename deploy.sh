#!/bin/bash
git pull

if [ $? -eq 0 ]
    then
        echo '已获取最新的代码'
        hexo generate
else
    echo '获取最新代码失败'
    exit
fi

if [ $? -eq 0 ] 
    then 
        echo '博客静态文件生成成功'
        rm -rf /www/wwwroot/blog_luohuidong_cn/*
else
    echo 'hexo 未安装'
    exit
fi


if [ $? -eq 0 ]
    then
        echo '清除旧静态文件成功'
        cp -r public/* /www/wwwroot/blog_luohuidong_cn/
else 
    echo '清除旧文件失败'
    exit
fi


if [ $? -eq 0 ]
    then
        echo '复制新静态文件成功'
else
    echo '复制新静态文件失败'
    exit
fi
