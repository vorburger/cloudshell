FROM golang AS gotty-build
RUN go get github.com/yudai/gotty \
 && echo GOPATH=$GOPATH && $GOPATH/bin/gotty || true

# TODO add Debian variant..

# TODO :latest ==> 31 instead of 30 ?
FROM fedora AS fedora-updated
RUN dnf update -y

# TODO dnf install -y hostname
# `hostname` is used in our init script

# TODO man, https://github.com/vorburger/vorburger-dotfiles-bin-etc/blob/master/container/devshell/Dockerfile

FROM fedora-updated AS cloudshell-fedora
COPY --from=gotty-build /go/bin/gotty /gotty
COPY ./init /init
ENV TERM=xterm-256color
EXPOSE 8080
ENTRYPOINT /gotty --credential "$USER_ID":"$USER_PWD" --permit-write /init bash

# TODO support other shell than bash (zsh, fish, ..) based on the SHELL environment variable
