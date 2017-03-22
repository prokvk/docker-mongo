COMMON_NAME = mongo
MONGO_PORT = 27017

IMAGE = $(COMMON_NAME)
NAME = $(COMMON_NAME)
# NET = --net=pstruch
PORTS = -p $(MONGO_PORT):$(MONGO_PORT)
# -v $$PWD/data:/data/db
VOLUMES = \
	-v /usr/data/mongo:/data/db

.PHONY: build run stop inspect rm logs ports

build:
		docker build -t $(IMAGE) .

run:
		docker run -d $(NET) --name $(NAME) $(PORTS) $(VOLUMES) $(IMAGE) mongod --nojournal --smallfiles
		# docker run --rm -it $(NET) --name $(NAME) $(PORTS) $(VOLUMES) $(IMAGE) mongod --nojournal --smallfiles

stop:
		docker stop $(NAME)
		docker rm $(NAME)

inspect:
		docker exec -it $(NAME) bash

rm:
		docker rm $(NAME)

logs:
		docker logs $(NAME)

ports:
		docker port $(NAME)
