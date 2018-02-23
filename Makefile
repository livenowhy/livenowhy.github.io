all: deploy

# 生成镜像
TAG = latest
PREFIX = index.boxlinker.com
IMAGE_NAME = liuzhangpei/hexo



g:
	hexo clean
	hexo g

web: g
	hexo server

deploy: g
	hexo deploy


git: g
	git add -A
	git commit -a -m "...."
	git push origin master

container:
	docker build -t ${PREFIX}/${IMAGE_NAME}:${TAG} .

clean:
	docker rmi -f $(PREFIX):$(TAG) || true

pushimage: container
	docker push ${PREFIX}/${IMAGE_NAME}:${TAG}


BLOG_NAME = hexo-blog
rundocker:
	docker stop ${BLOG_NAME} || true
	docker rm -f ${BLOG_NAME} || true
	docker run -d -p 80:4000 --name hexo-blog ${PREFIX}/${IMAGE_NAME}:${TAG}




#  index.boxlinker.com/liuzhangpei/hexo:latest



