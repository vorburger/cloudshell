FROM golang AS gotty-build
RUN go get github.com/yudai/gotty \
 && echo GOPATH=$GOPATH && $GOPATH/bin/gotty || true
