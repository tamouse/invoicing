DOCKER_UUIDS=`docker ps -aq`
CONTAINER=invoicing

all:
	@echo "Options:"
	@echo " - clean: remove docker containers"
	@echo " - create: create docker containers"
	@echo " - run: run docker containers"
	@echo " - list: list docker containers"
	@echo " - logs: tail log file of invoicing container"

list:
	docker ps -a

list_uuids:
	@echo ${DOCKER_UUIDS}

clean:
	docker rm ${DOCKER_UUIDS}

create: create_gems_21 build_app

create_gems_21:
	docker create -v /ruby_gems/2.1 --name gems-2.1 busybox

build_app: Dockerfile
	docker build -t ${CONTAINER} .

run:
	docker run -d --name=${CONTAINER} --volumes-from=gems-2.1 ${CONTAINER}

logs:
	@docker logs -f ${CONTAINER}
