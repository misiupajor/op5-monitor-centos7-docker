FROM centos/systemd
MAINTAINER "Misiu Pajor" <misiu.pajor@op5.com>

ARG OP5_MONITOR_SOFTWARE_URL=https://s3-eu-west-1.amazonaws.com/op5-filebase/Downloads/op5_monitor_archive/op5-monitor-7.3.17-20171013.tar.gz
ENV OP5_MONITOR_SOFTWARE_URL=$OP5_MONITOR_SOFTWARE_URL

RUN yum -y install wget which openssh-server net-tools

# Expose ports that are required by OP5
EXPOSE 80 443 5666 15551 22 161/tcp 162/udp

# Prepare entrypoint that will install OP5 Monitor when building
COPY entrypoint.sh /root/entrypoint.sh
RUN chmod +x /root/entrypoint.sh

CMD ["/usr/sbin/init"]
