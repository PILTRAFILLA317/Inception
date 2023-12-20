.PHONY: all build run stop clean

all: build run

build:
	docker-compose build

run:
	docker-compose up -d

stop:
	docker-compose down

clean: stop
	docker-compose rm -f

