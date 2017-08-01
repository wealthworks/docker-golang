VERSION = 1.8.1-r0

.PHONY: build

build:
	docker build -t lcgc/golang:$(VERSION) .
