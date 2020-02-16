serve: down build
		docker-compose up -d

down:
	docker-compose down

build:
	docker-compose build

download:
	curl localhost:4567/download

organise:
	curl localhost:4568/organise

consume:
	curl localhost:4569/consume
