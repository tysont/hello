FROM ubuntu:16.04

ADD bin/hello /opt/hello/hello

ENTRYPOINT /opt/hello/hello

EXPOSE 8080