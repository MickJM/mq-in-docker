#
FROM mqbase:01
#
#RUN chmod 755 /usr/local/bin/mq*.sh
#
ENV IBM_MQ_PRIMARYLOGFILES=3
ENV IBM_MQ_SECONDARYLOGFILES=4
ENV IBM_MQ_LISTENER=1414
#
#EXPOSE 1414
#
RUN mkdir -p /usr/local/mqmonitor/bin \
   && mkdir -p /usr/local/mqmonitor/bin/config 
COPY ./sourceFiles/mq-metrics-1.0.0.17.jar /usr/local/mqmonitor/bin
COPY ./mqscripts/qmgrs/QMAP01/config/application-local-qm.yaml /usr/local/mqmonitor/bin/config
COPY ./sourceFiles/api-mq-certs-1.0.0.0.jar /usr/local/mqmonitor/bin
COPY ./sourceFiles/config/application-dev-api.yaml /usr/local/mqmonitor/bin/config
#
RUN yum install -y bc \
   && yum install -y java-11-openjdk.x86_64
#
WORKDIR /home/mqm
#RUN ls -lrt /home/mqm/scripts/mqscripts 
#RUN /home/mqm/scripts/mqscripts/mqCreateUsers
#
USER root
#
#COPY ./mqFiles/mq* /home/mqm/
RUN cd /home/mqm
#RUN ls -lrt
# 
ENTRYPOINT ["/home/mqm/scripts/mqscripts/mqDriver"]