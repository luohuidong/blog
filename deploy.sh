#!/bin/bash
hexo generate
rm -rf /www/wwwroot/blog_luohuidong_cn/*
cp -r public/* /www/wwwroot/blog_luohuidong_cn/
