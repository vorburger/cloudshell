# Open Cloud Web Terminal Shell

Container running a Web Terminal to a Linux Shell for development in a ☁️  Cloud.


## Usage

### Locally

    sudo docker run --hostname=testhost -eUSER_ID=YOURUID -eUSER_PWD=YOURPWD --rm -p 8080:8080 gcr.io/vorburger/github.com/vorburger/cloudshell-debian

    podman run --hostname=testhost -eUSER_ID=YOURUID -eUSER_PWD=YOURPWD --rm -p 8080:8080 gcr.io/vorburger/github.com/vorburger/cloudshell-fedora

You can now access a web-based shell on http://localhost:8080! (Login with the _YOURUID_ & _YOURPWD_ chosen above.)


### Optional additional container environment variables

* `USER_SHELL` can be set to `/usr/bin/bash` or `/usr/bin/zsh` instead of the default [Fish shell](https://fishshell.com).
* `GOTTY_TERM` can be set to `hterm` instead of the default `xterm`
* `GOTTY_TITLE_FORMAT` = "Cloud Shell" (or whatever HTML TITLE you like)


## Features

* is simple to use & run, available from a container registery
* offers both Debian and Fedora containers
* has regular user account (not `root`)
* has `sudo` working (useful e.g. for quick package installation)
* customizable by deriving your own container `FROM cloudshell` (this one); [as e.g. in this Dockerfile](https://github.com/vorburger/vorburger-dotfiles-bin-etc/blob/master/Dockerfile-cloudshell)


## Develop

    ./build

Now simply run like in the _Locally_ section above, but use only `cloudshell-fedora`
(or `cloudshell-debian`) instead of pulling from the remote `gcr.io/...` registry.


## Based on

* https://xtermjs.org _(via gotty)_
* https://hterm.org ([on chromium.googlesource.com](https://chromium.googlesource.com/apps/libapps/+/HEAD/hterm), _via gotty)_
* https://github.com/vorburger/GoTTY (forked from https://github.com/yudai/GoTTY); BTW note https://github.com/moul/gotty-client


## Similar projects (open source)

* https://github.com/paradoxxxzero/butterfly


## Similar projects (not open source)

* https://ssh.cloud.google.com
* https://shell.azure.com
* https://www.google.com/search?q=cloud+shell


## References

* http://blog2.vorburger.ch/2020/04/open-cloud-web-terminal-shell.html
* https://github.com/kubernetes/minikube/issues/7419
