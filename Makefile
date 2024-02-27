WORDPRESS	:=	$(HOME)/data/wordpress/
MARIADB		:=	$(HOME)/data/mariadb/

all: $(WORDPRESS) $(MARIADB) 
	@docker-compose -f ./srcs/docker-compose.yml up

down:
	@docker-compose -f ./srcs/docker-compose.yml down

re:
	@docker-compose -f srcs/docker-compose.yml up --build

clean:
	@docker stop $$(docker ps -qa);\
	docker rm $$(docker ps -qa);\
	docker rmi -f $$(docker images -qa);\
	rm -rf $(WORDPRESS)
	rm -rf $(MARIADB)

logs:
	@-docker compose -f ./srcs/docker-compose.yml logs -f --tails 50

$(WORDPRESS):
	@mkdir -p $(WORDPRESS)

$(MARIADB):
	@mkdir -p $(MARIADB)

.PHONY: all re down clean
