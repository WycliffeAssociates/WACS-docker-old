.PHONY: build
build:
	export IMAGE_TAG="local" \
	&& cd wacs-gitea \
	&& docker build -t registry.walink.org/wa/wacs:$${IMAGE_TAG} .

.PHONY: run
run: build
	export IMAGE_TAG="local" \
	export EXTERNAL_DATA_BOOL=false \
	&& cd wacs-gitea \
	&& docker compose up -d \

.PHONY: admin-user
admin-user:
	docker compose exec gitea /usr/local/bin/gitea -c '/custom/conf/app.ini' admin create-user --username admin2 --password 1234 --email asdf@example.com --admin

.PHONY: down
down: 
	docker compose down
