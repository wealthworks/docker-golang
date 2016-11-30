VERSION = 1.7.3-r0

.PHONY: build

build:
	docker build -t lcgc/golang:$(VERSION) .
