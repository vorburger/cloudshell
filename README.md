# Open Cloud Web Terminal Shell

Container running a Web Terminal to a Linux Shell for development in a ☁️  Cloud.


## Usage

### Locally

    ./build

    docker | podman run --hostname=testhost -eUSER_ID=YOURUID -eUSER_PWD=YOURPWD --rm -p 8080:8080 cloudshell-fedora

You can now access a web-based shell on http://localhost:8080! (Login with the _YOURUID_ & _YOURPWD_ chosen above.)


## Features

* is simple to use & run!
* has regular user account (not `root`)
* has `sudo` working (useful e.g. for quick package installation)
* customizable by deriving your own container `FROM cloudshell` (this one); [as e.g. in this Dockerfile](https://github.com/vorburger/vorburger-dotfiles-bin-etc/blob/master/Dockerfile-cloudshell)


## Based on

* https://xtermjs.org _(via gotty)_
* https://hterm.org ([on chromium.googlesource.com](https://chromium.googlesource.com/apps/libapps/+/HEAD/hterm), _via gotty)_
* https://github.com/vorburger/GoTTY (forked from https://github.com/yudai/GoTTY)


## Similar projects (not open source)

* https://ssh.cloud.google.com
* https://shell.azure.com
* https://www.google.com/search?q=cloud+shell
