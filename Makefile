SHELL = /bin/bash
APP_NAME = hello
AWS_REGION = us-east-2
AWS_DOCKER_REPO = 986335475748.dkr.ecr.us-east-2.amazonaws.com/$(APP_NAME)

.PHONY: all 

all: clean build package

clean:
	rm -rf bin temp

build:
	mkdir -p bin
	GOOS=linux GOARCH=amd64 go build -o bin/$(APP_NAME)

package:
	docker build -t $(APP_NAME) .

run:
	docker run -i -t --rm --publish 8080:8080 --name=$(APP_NAME) $(APP_NAME)
	

CMD_REPOLOGIN := "eval $$\( aws ecr get-login --region $(AWS_REGION) --no-include-email \)"
publish:
	@eval $(CMD_REPOLOGIN)
	docker tag $(APP_NAME):latest $(AWS_DOCKER_REPO):latest
	docker push $(AWS_DOCKER_REPO):latest
