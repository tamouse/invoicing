all:
	@echo "Options:"
	@echo " - clean: remove docker containers"
	@echo " - create_gems_21: create gems docker data container"
	@echo " - up: build and start the application containers"
	@echo " - test: run tests"
	@echo " - list: list docker containers"
	@echo " - logs: tail log file of invoicing container"
	@echo " - annotate: run the annotate gem"

clean:
	fig stop
	fig rm --force -v

create_gems_21:
	docker create -v /ruby_gems/2.1 --name gems-2.1 busybox

up: Dockerfile docker-compose.yml
	fig up

test:
	fig run dev bin/rake

list:
	fig ps

logs:
	fig logs

annotate:
	fig run dev bundle exec annotate
