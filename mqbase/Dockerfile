#
# MQ Base image
#
FROM centos:latest
#
LABEL version="1.0"
LABEL description="IBM MQ Base docker image"
LABEL maintainer "Mick Moriarty"
LABEL mqversion="9.2"
# mqadv_dev920_linux_x86-64.tar.g
# mqadv_dev920_linux_x86-64.tar.gz
ARG MQIMAGE
ENV IMG=${MQIMAGE}
#
LABEL mqimage=${VER}
#
RUN mkdir -p /tmp/mq
COPY ./sourceFiles/${IMG} /tmp/mq/
#
RUN yum -y update \
  && yum -y install rsyslog less curl \
  && yum -y update \
  && yum -y install wget \
# Add the mqm user and a nominal mq client user  
  && groupadd --gid 1000 mqm \
  && useradd -m --uid 1000 --gid mqm mqm \
  && groupadd mqdocker \
  && useradd --gid mqdocker mqdocker \
  && echo mqdocker:mqdockerpassw0rd | chpasswd \
  && usermod -G mqm mqdocker \
#  Add other users, such as IIB/ACE here 
#  && mkdir -p /home/mqm/runmqsc \
  && cd /tmp/mq \
# mqadv_dev915_linux_x86-64.tar.gz
# mqadv_dev920_linux_x86-64.tar.gz
  && tar -zxvf ${IMG} \
  && rm -rf ${IMG} \
  && cd /tmp/mq/MQServer \
  && ./mqlicense.sh -accept \
  && ls -lrt *.rpm \
  && rpm -ivh MQSeriesRuntime-*.rpm \
  && rpm -ivh MQSeriesGSKit-*.rpm \
  && rpm -ivh MQSeriesServer-*.rpm \
  && rpm -ivh MQSeriesClient-*.rpm \
  && rpm -ivh MQSeriesJRE-*.rpm \
  && rpm -ivh MQSeriesJava-*.rpm \
  && rpm -ivh MQSeriesWeb-*.rpm \
  && rpm -ivh MQSeriesAMS-*.rpm \
  && rpm -ivh MQSeriesSamples-*.rpm \
# Install IIB/ACE here if needed
  && ls -lrt \
# clean up - remove the mq packages
  && cd / \
  && rm -rf /tmp/mq
#