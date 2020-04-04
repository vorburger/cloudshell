# Open Cloud Web Terminal Shell

Container running a Web Terminal to a Linux Shell for development in a ☁️  Cloud.


## Usage

### Locally

    ./build

    sudo docker run --hostname=testhost -eUSER_ID=YOURUID -eUSER_PWD=YOURPWD --rm -p 8080:8080 cloudshell-debian

    podman run --hostname=testhost -eUSER_ID=YOURUID -eUSER_PWD=YOURPWD --rm -p 8080:8080 cloudshell-fedora

You can now access a web-based shell on http://localhost:8080! (Login with the _YOURUID_ & _YOURPWD_ chosen above.)


### Optional additional container environment variables

* `USER_SHELL` can be set to `/usr/bin/bash` or `/usr/bin/zsh` instead of the default [Fish shell](https://fishshell.com).
* `GOTTY_TERM` can be set to `hterm` instead of the default `xterm`
* `GOTTY_TITLE_FORMAT` = "Cloud Shell" (or whatever HTML TITLE you like)


## Features

* is simple to use & run!
* both Debian and Fedora containers
* has regular user account (not `root`)
* has `sudo` working (useful e.g. for quick package installation)
* customizable by deriving your own container `FROM cloudshell` (this one); [as e.g. in this Dockerfile](https://github.com/vorburger/vorburger-dotfiles-bin-etc/blob/master/Dockerfile-cloudshell)


## Based on

* https://xtermjs.org _(via gotty)_
* https://hterm.org ([on chromium.googlesource.com](https://chromium.googlesource.com/apps/libapps/+/HEAD/hterm), _via gotty)_
* https://github.com/vorburger/GoTTY (forked from https://github.com/yudai/GoTTY); BTW note https://github.com/moul/gotty-client


## Similar projects (not open source)

* https://ssh.cloud.google.com
* https://shell.azure.com
* https://www.google.com/search?q=cloud+shell
