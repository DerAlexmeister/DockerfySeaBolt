# Dockerfile for Seabolt
# Using Apline and Golang

FROM golang:1.14-alpine as build

RUN apk add --no-cache ca-certificates cmake make g++ openssl-dev git curl pkgconfig

RUN apk add libressl-dev

RUN git clone -b 1.7 https://github.com/neo4j-drivers/seabolt.git /seabolt

WORKDIR /seabolt/build

RUN cmake -D CMAKE_BUILD_TYPE=Release -D CMAKE_INSTALL_LIBDIR=lib .. && cmake --build . --target install

RUN curl https://raw.githubusercontent.com/golang/dep/master/install.sh | sh 

# ... Here you can build your go-files.