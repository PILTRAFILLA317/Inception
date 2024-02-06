MARIADB_PATH=/Users/umartin-/Documents/data/DB
WORDPRESS_PATH=/Users/umartin-/Documents/data/wordpress

all : build

up :
	@docker-compose -f ./srcs/docker-compose.yml up -d
build : 
	@docker-compose -f ./srcs/docker-compose.yml up --build -d
down :
	@docker-compose -f ./srcs/docker-compose.yml down
stop :
	@docker-compose -f ./srcs/docker-compose.yml stop
start :
	@docker-compose -f ./srcs/docker-compose.yml start
status :
	@docker ps
re : down clean build


exec-n :
	docker exec -it nginx sh


exec-w :
	docker exec -it wordpress sh
down-w :
	@docker-compose -f ./srcs/docker-compose.yml down wordpress
clean-w :

build-w :
	@docker-compose -f ./srcs/docker-compose.yml up --build -d wordpress
re-w : down-w clean-m build-m


exec-m :
	docker exec -it mariadb sh
down-m :
	docker-compose -f ./srcs/docker-compose.yml down -v --remove-orphans mariadb
clean-m :
	rm -rf ./app/mariadb/data/*
build-m :
	@docker-compose -f ./srcs/docker-compose.yml up --build -d mariadb
re-m : down-m clean-m build-m

clean:
	rm -rf $(MARIADB_PATH)/*
	rm -rf $(WORDPRESS_PATH)/*

fclean: down clean
	docker volume prune -f
	docker image prune -a
	docker network prune -f
	# docker rm $(docker ps -a -f status=exited -q)
	docker system prune -a
