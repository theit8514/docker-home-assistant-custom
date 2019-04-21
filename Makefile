
CONTAINER_NAME=homeassistant

install:
	docker build -t home-assistant-custom build

upgrade:
	docker build --pull -t home-assistant-custom build

force:
	docker build --no-cache -t home-assistant-custom build

stop:
	-docker stop ${CONTAINER_NAME}

remove:
	-docker rm ${CONTAINER_NAME}
	-docker rm -f ${CONTAINER_NAME}

run: stop remove
	docker run -d \
		--name ${CONTAINER_NAME} \
		-v /etc/localtime:/etc/localtime:ro \
		-v /opt/docker/${CONTAINER_NAME}/data/config/:/config \
		--restart=always \
		--net=host \
		-e PUID=1000 \
		-e PGID=1000 \
		--log-opt max-size=2m \
		home-assistant-custom

