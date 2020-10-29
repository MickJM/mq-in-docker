#
# MQ Base image
#
FROM centos:latest
#
LABEL version="1.0"
LABEL description="IBM MQ Base docker image"
LABEL maintainer "Mick Moriarty"
#
RUN mkdir -p /tmp/mq
COPY ./sourceFiles/mqadv_dev915_linux_x86-64.tar.gz /tmp/mq/
#
RUN yum -y update \
  && yum -y install rsyslog less curl \
  && yum -y update \
# Add the mqm user and a nominal mq client user  
  && groupadd --gid 1000 mqm \
  && useradd -m --uid 1000 --gid mqm mqm \
  && groupadd mqdocker \
  && useradd --gid mqdocker mqdocker \
  && echo mqdocker:mqdockerpassw0rd | chpasswd \
  && usermod -G mqm mqdocker \
#  Add other users, such as IIB/ACE here
  && mkdir -p /home/mqm/runmqsc \
  && cd /tmp/mq \
  && tar -zxvf mqadv_dev915_linux_x86-64.tar.gz \
  && rm -rf mqadv_dev915_linux_x86-64.tar.gz \
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
   && ls -lrt
#
