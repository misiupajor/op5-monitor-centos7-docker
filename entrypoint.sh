#!/bin/bash
# Install OP5 Monitor (currently v7.3.17)
wget $OP5_MONITOR_SOFTWARE_URL -O /tmp/op5-software.tar.gz \
    && mkdir -p /tmp/op5-monitor && tar -zxf /tmp/op5-software.tar.gz -C /tmp/op5-monitor --strip-components=1 \
    && cd /tmp/op5-monitor && ./install.sh --silent \
    && rm -f /tmp/op5-software.tar.gz \
    && cd /tmp && rm -rf /tmp/op5-monitor \
    && yum clean all
