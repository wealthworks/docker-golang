VERSION = 1.7.3-r5

.PHONY: build

build:
	docker build -t lcgc/golang:$(VERSION) .
