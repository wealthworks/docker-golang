VERSION = 1.7.3-r3

.PHONY: build

build:
	docker build -t lcgc/golang:$(VERSION) .
