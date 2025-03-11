# 定义变量
IMAGE_NAME = neo4j-apoc
CONTAINER_NAME = neo4j-apoc

# 构建 Docker 镜像
build:
	docker build -t $(IMAGE_NAME) .

# 运行 Neo4j 容器
run:
	docker run -d --name $(CONTAINER_NAME) \
	  -p 7474:7474 -p 7687:7687 \
	  -v $(PWD)/data:/data \
	  -v $(PWD)/plugins:/plugins \
	  $(IMAGE_NAME)

# 停止容器
stop:
	docker stop $(CONTAINER_NAME)

# 删除容器
remove:
	docker rm -f $(CONTAINER_NAME)

# 重新启动容器
restart: stop run

# 查看容器日志
logs:
	docker logs -f $(CONTAINER_NAME)

# 进入容器终端
shell:
	docker exec -it $(CONTAINER_NAME) bash

# 清理所有数据（慎用）
clean:
	docker stop $(CONTAINER_NAME) || true
	docker rm -f $(CONTAINER_NAME) || true
	docker rmi -f $(IMAGE_NAME) || true
	rm -rf data/* plugins/*

.PHONY: build run stop remove restart logs shell clean
