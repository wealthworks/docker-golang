FROM alpine:edge
MAINTAINER Eagle Liut <liutao@licaigc.com>

RUN apk --update add \
	bash \
	ca-certificates \
	git \
	go \
	go-tools \
	make \
	libc-dev \
	openssh-client \
	postgresql-client \
	&& rm -f /usr/bin/godoc /usr/lib/go/bin/godoc \
	&& rm -f /usr/bin/darwin* /usr/bin/freebsd* /usr/bin/openbsd* /usr/bin/windows* \
	&& rm -rf /usr/lib/go/bin/darwin* /usr/lib/go/bin/freebsd* /usr/lib/go/bin/openbsd* /usr/lib/go/bin/windows* \
	&& rm -rf /var/cache/apk/*

ENV GOPATH=/go PATH=$GOPATH/bin:$PATH

RUN mkdir -p "$GOPATH/src" "$GOPATH/bin" && chmod -R 777 "$GOPATH"
WORKDIR $GOPATH

RUN go env \
	&& mkdir -p $GOPATH/src/golang.org/x $GOPATH/src/google.golang.org \
	&& cd $GOPATH/src/golang.org/x \
	&& git clone git://github.com/golang/crypto.git \
	&& git clone git://github.com/golang/net.git \
	&& git clone git://github.com/golang/oauth2.git \
	&& cd $GOPATH/src/google.golang.org \
	&& git clone git://github.com/google/go-genproto.git genproto \
	&& git clone -qb v1.0.4 git://github.com/grpc/grpc-go.git grpc \
	&& cd $GOPATH/src \
	&& go get github.com/gin-gonic/contrib/sentry \
	&& go get github.com/golang/protobuf/proto \
	&& go get github.com/golang/glog \
	&& go get gopkg.in/vmihailenco/msgpack.v2 \
	&& go get github.com/xxtea/xxtea-go/xxtea \
	&& go get github.com/bcho/bearychat \
	&& go get github.com/rainycape/memcache \
	&& go get gopkg.in/check.v1 \
	&& go get github.com/stretchr/testify \
	&& rm -rf $GOPATH/pkg

RUN mkdir -p $GOPATH/src/lcgc/platform \
	&& cd $GOPATH/src/lcgc/platform \
	&& git clone git://github.com/wealthworks/envflagset.git \
	&& go get github.com/statsd/client-interface \
	&& go get github.com/statsd/client \
	&& go get github.com/wealthworks/gracegrpc \
	&& mkdir -p $GOPATH/src/gopkg.in/go-pg \
	&& cd $GOPATH/src/gopkg.in \
	&& git clone -qb v4 git://github.com/liut/pg.git pg.v4 \
	&& git clone -qb v5 git://github.com/liut/pg.git pg.v5 \
	&& cd $GOPATH/src/gopkg.in/go-pg \
	&& git clone -qb v5 git://github.com/liut/sharding.git sharding.v5 \
	&& go get gopkg.in/go-pg/sharding.v5 \
	&& go get github.com/liut/osin-storage/storage \
	&& go get github.com/mitchellh/mapstructure \
	&& rm -rf $GOPATH/pkg
