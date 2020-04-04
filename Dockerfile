FROM golang AS gotty-build
RUN go get github.com/yudai/gotty \
 && echo GOPATH=$GOPATH && $GOPATH/bin/gotty || true

# TODO add Debian variant..

FROM fedora AS fedora-updated
RUN dnf update -y

FROM fedora-updated AS cloudshell-fedora
COPY --from=gotty-build /go/bin/gotty /gotty
ENV TERM=xterm-256color
EXPOSE 8080
ENTRYPOINT ["/gotty", "--permit-write"]
CMD ["bash"]
# TODO allow customization for other shells
