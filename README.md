# OP5 Monitor on CentOS 7, in Docker.
OP5 Monitor is a software product for server, Network monitoring and management based on the Open Source project Nagios.
This repository contains the OP5 Monitor software, in docker.

![OP5 Monitor, in docker](https://user-images.githubusercontent.com/2470979/30489703-398bcd3e-9a38-11e7-88e3-8b2da7b67a4f.png)

> This image is not a OP5 official release and therefore does not adhere to your support agreement you may have with OP5.

## Features

 * Latest version of OP5 monitor to date (currently v7.3.17) on _CentOS 7.4_
 * Pre-bundled with a trial license

## Install

Clone this repo to your docker server and run the build script that comes with it:

```sh
$ git clone https://github.com/misiupajor/op5-monitor-centos7-docker.git
$ cd op5-monitor-centos7-docker
$ ./build.sh
```

Now follow instructions under the ```usage``` section to run the container.

## Usage

Run the docker container:

```sh
$ docker run -tid --cap-add SYS_ADMIN -p 443:443 -p 22222:22 op5com/op5-monitor-centos7
```

Now you can reach OP5 Monitor on:

https://`<docker server>`:443

And over SSH on port ```22222``` with credentials:
username: root
password: monitor

## Contributors

Thanks goes to these wonderful people:

* Oskar Rittsel ([@OP5](https://www.op5.com))

## Author
**Misiu Pajor**

* [github/misiupajor](https://github.com/misiupajor)
