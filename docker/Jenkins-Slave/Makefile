ROOT:=$(shell dirname $(realpath $(lastword $(MAKEFILE_LIST))))
IMAGE_NAME:=sptnk/qa_slave:latest

build:
	docker build -t ${IMAGE_NAME} .
