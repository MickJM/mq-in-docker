#  
# Create MQ Server image from the installation MQBase image
#
FROM mqbase:2
#
LABEL version="1.0"
LABEL description="MQ Server docker image, build from mqbase image"
LABEL maintainer "Mick Moriarty"
#
ENV IBM_MQ_PRIMARYLOGFILES=3
ENV IBM_MQ_SECONDARYLOGFILES=4
ENV IBM_MQ_LISTENER=1414
#
# Make folders for the MQMonitoring APIs
#
RUN mkdir -p /usr/local/mqmonitor/bin \
   && mkdir -p /usr/local/mqmonitor/bin/config \
   && mkdir -p /home/mqm/bin/mqmonitor 

#
# Copy MQMonitoring API and config file, and api-mq-certs to show certificates on the queue manager
#COPY ./sourceFiles/mq-metrics-1.0.0.18.jar /usr/local/mqmonitor/bin
## config file created in mqQmgrMetrics
#COPY ./mqscripts/qmgrs/QMAP01/config/application-local-qm.yaml /usr/local/mqmonitor/bin/config
#COPY ./sourceFiles/mq-metrics-1.0.0.18.jar /home/mqm/bin/mqmetrics
#COPY ./sourceFiles/api-mq-certs-1.0.0.0.jar /usr/local/mqmonitor/bin
#COPY ./sourceFiles/config/application-dev-api.yaml /usr/local/mqmonitor/bin/config
#
RUN yum install -y bc \
   && yum install -y java-11-openjdk.x86_64
#
WORKDIR /home/mqm
USER root
#
RUN cd /home/mqm
# 
ENTRYPOINT ["/home/mqm/scripts/mqscripts/mqDriver"]
