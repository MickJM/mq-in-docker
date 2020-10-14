#
FROM centos:latest
#
#ARG MQ_SOURCEFILE="MQ_V9.0_F_LNX_ON_X86_64_EIMAGE.tar.gz"
# MQ_V9.0_F_LNX_ON_X86_64_EIMAGE.tar.gz
#
RUN mkdir -p /tmp/mq
COPY ./sourceFiles/mqadv_dev915_linux_x86-64.tar.gz /tmp/mq/
#COPY ./sourceFiles/threads-max /proc/sys/kernel/threads-max
#
RUN yum -y update \
##  && yum -y install --no-install-recommends \
#    bash \
#    bc \
#    curl \
##    debianutils \
 #   rpm  \
#    procps \
#    sed \
#    tar \    
#    util-linux \
  && yum -y install rsyslog less curl \
  && yum -y update \
# Add the mqm user and a nominal mq client user  
  && groupadd --gid 1000 mqm \
  && useradd -m --uid 1000 --gid mqm mqm \
  && groupadd mqdocker \
  && useradd --gid mqdocker mqdocker \
  && echo mqdocker:mqdockerpassw0rd | chpasswd \
  && usermod -G mqm mqdocker \
#  && usermod -a -g mqdocker mqdocker \
#  && groupadd mqbrkrs \
#  && useradd -m iibadmin \
#  && usermod -a -G mqbrkrs iibadmin \
#  && usermod -a -G mqbrkrs mqm \
##  && usermod -a -G mqm iibadmin \
  && mkdir -p /home/mqm/runmqsc \
  && cd /tmp/mq \
  && tar -zxvf mqadv_dev915_linux_x86-64.tar.gz \
  && rm -rf mqadv_dev915_linux_x86-64.tar.gz \
##  && rm -rf MQ_V9.0_F_LNX_ON_X86_64_EIMAGE.tar.gz \
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
##  && groupadd kafkaapp01 \
##  && useradd -M kafka01 \
##  && usermod -G kafkaapp01 kafka01 \
##  && chown iibadmin:iibadmin /home/iibadmin/ \
##  && mkdir -p /opt/ibm \
##  && chown iibadmin:iibadmin /opt/ibm/ \
##  && cd /tmp/mq \
##  && tar -zxvf /tmp/mq/IIB_V10.0.0.7_LINUX_X86-64.tar.gz --exclude iib-10.0.0.7/tools --directory /tmp/mq \
##  && rm -rf /tmp/mq/IIB_V10.0.0.7_LINUX_X86-64.tar.gz \
##  && cd /opt/ibm \
##  && tar -zxvf /tmp/mq/EAsmbl_image/iib-10.0.0.7.tar.gz --exclude iib-10.0.0.7/tools --directory /opt/ibm \
##  && chown -R iibadmin:iibadmin /opt/ibm/* \
##  && cd iib-10.0.0.7 \
##  && ./iib make registry global accept license silently \
##   && rm -rf /tmp/mq/ \
   && ls -lrt
#
##COPY ./mqFiles/mq*.sh /usr/local/bin/
#COPY ./runmqsc/*.mqsc /home/mqm/runmqsc/
#
#EXPOSE 1414
#EXPOSE 1414 7800 4414
#
##RUN chmod 755 /usr/local/bin/*.sh 
#USER mqm
#  && /usr/local/bin/mq_manager.sh \
#  && /usr/local/bin/iib_manager.sh
#
