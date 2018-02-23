FROM registry.cn-hangzhou.aliyuncs.com/livenowhy/node:alpine

MAINTAINER liuzhangpei liuzhangpei@126.com

RUN npm install -g hexo
RUN mkdir /myhexo
#RUN cd /myhexo && hexo init

WORKDIR /myhexo
EXPOSE 4000

ADD . /myhexo

RUN hexo clean && hexo g


CMD ["hexo","server"]
