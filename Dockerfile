FROM golang AS gotty-build
RUN go get github.com/yudai/gotty \
 && echo GOPATH=$GOPATH && $GOPATH/bin/gotty || true

# TODO add Debian variant..

FROM fedora:latest AS fedora-updated
RUN dnf update -y

FROM fedora-updated AS fedora-plus
# For CentOS instead of Fedora, use /etc/yum.conf instead of /etc/dnf/dnf.conf:
RUN sed -i -e '/tsflags=nodocs/s/^/#/' /etc/dnf/dnf.conf \
 && dnf install -y openssh-clients git hub findutils man-db man man-pages less which htop \
                   nano micro bash-completion zsh fish iputils net-tools golang-bin \
                   powerline-fonts ShellCheck tmux

FROM fedora-plus AS cloudshell-fedora
COPY --from=gotty-build /go/bin/gotty /gotty
COPY ./init /init
ENV TERM=xterm-256color
EXPOSE 8080
ENTRYPOINT /gotty --credential "$USER_ID":"$USER_PWD" --permit-write /init bash

# TODO support other shell than bash (zsh, fish, ..) based on the SHELL environment variable
