FROM alpine:edge
MAINTAINER Eagle Liut <liutao@licaigc.com>

RUN echo "http://dl-4.alpinelinux.org/alpine/edge/community" >> /etc/apk/repositories


RUN apk --update add \
	bash \
	ca-certificates \
	git \
	go \
	go-tools \
	make \
	openssh-client \
	postgresql-client \
	&& rm -rf /var/cache/apk/* \
	&& rm -f /usr/bin/darwin* /usr/bin/freebsd* /usr/bin/openbsd* /usr/bin/windows* \
	&& rm -rf /usr/lib/go/bin/darwin* /usr/lib/go/bin/freebsd* /usr/lib/go/bin/openbsd* /usr/lib/go/bin/windows*

ENV GOPATH /go
ENV PATH $GOPATH/bin:$PATH

RUN mkdir -p "$GOPATH/src" "$GOPATH/bin" && chmod -R 777 "$GOPATH"
WORKDIR $GOPATH

RUN go env \
	&& mkdir -p $GOPATH/src/golang.org/x $GOPATH/src/google.golang.org/grpc \
	&& cd $GOPATH/src/golang.org/x \
	&& git clone https://github.com/golang/crypto.git \
	&& git clone https://github.com/golang/net.git \
	&& git clone https://github.com/golang/oauth2.git \
	&& cd $GOPATH/src/google.golang.org/ \
	&& git clone git://github.com/grpc/grpc-go.git grpc \
	&& cd $GOPATH/src \
	&& go get github.com/gin-gonic/contrib/sentry \
	&& go get github.com/golang/protobuf/proto \
	&& go get github.com/golang/glog \
	&& go get gopkg.in/vmihailenco/msgpack.v2 \
	&& go get gopkg.in/check.v1

RUN mkdir -p $GOPATH/src/lcgc/platform \
	&& cd $GOPATH/src/lcgc/platform \
	&& git clone https://github.com/wealthworks/envflagset.git

RUN mkdir -p $GOPATH/src/gopkg.in/pg.v4 $GOPATH/src/gopkg.in/go-pg/sharding.v4 \
	&& cd $GOPATH/src/gopkg.in \
	&& git clone https://github.com/liut/pg.git pg.v4 \
	&& cd $GOPATH/src/gopkg.in/go-pg \
	&& git clone https://github.com/liut/sharding.git sharding.v4 \
	&& go get gopkg.in/go-pg/sharding.v4
