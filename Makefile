SHELL = /bin/bash

.PHONY: all 

all: clean build

clean:
	rm -rf bin temp

build:
	mkdir -p bin
	GOOS=linux GOARCH=amd64 go build -o "bin/hello"