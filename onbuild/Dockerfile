FROM golang:1.6-alpine


RUN apk --update add \
	bash \
	ca-certificates \
	git \
	make \
	openssh-client \
	postgresql-client \
	&& rm -rf /var/cache/apk/*

RUN go env \
	&& mkdir -p /go/src/golang.org/x \
	&& cd /go/src/golang.org/x \
	&& git clone https://github.com/golang/crypto.git \
	&& git clone https://github.com/golang/net.git \
	&& cd /go/src \
	&& go get github.com/gin-gonic/contrib/sentry \
	&& go get github.com/golang/glog \
	&& go get gopkg.in/go-pg/sharding.v4
