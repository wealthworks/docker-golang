VERSION = 1.6

.PHONY: onbuild

onbuild:
	docker build -t lcgc/golang:$(VERSION)-onbuild onbuild/
