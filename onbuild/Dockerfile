FROM alpine:edge
MAINTAINER Eagle Liut <liutao@licaigc.com>

RUN echo "http://dl-4.alpinelinux.org/alpine/edge/community" >> /etc/apk/repositories


RUN apk --update add \
	bash \
	ca-certificates \
	git \
	go \
	make \
	openssh-client \
	postgresql-client \
	&& rm -rf /var/cache/apk/*

ENV GOPATH /go
ENV PATH $GOPATH/bin:$PATH

RUN mkdir -p "$GOPATH/src" "$GOPATH/bin" && chmod -R 777 "$GOPATH"
WORKDIR $GOPATH

RUN go env \
	&& mkdir -p /go/src/golang.org/x \
	&& cd /go/src/golang.org/x \
	&& git clone https://github.com/golang/crypto.git \
	&& git clone https://github.com/golang/net.git \
	&& cd /go/src \
	&& go get github.com/gin-gonic/contrib/sentry \
	&& go get github.com/golang/glog \
	&& go get gopkg.in/go-pg/sharding.v4

RUN mkdir -p /go/src/lcgc/platform \
	&& cd /go/src/lcgc/platform \
	&& git clone https://github.com/wealthworks/envflagset.git

