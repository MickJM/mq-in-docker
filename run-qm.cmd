::
::
docker volume rm mqdata-qmap01-log
docker volume create mqdata-qmap01-log

docker stop qm-qmap01a
docker rm qm-qmap01a
::
docker network rm mq-qmap01
docker network create --subnet=172.21.0.0/16 mq-qmap01
::::
::docker network rm mq-qmap02
::docker network create --subnet=172.22.0.0/16 mq-qmap02
::::
::
docker volume rm qmap01-qmgr
docker volume create qmap01-qmgr
::
::docker volume rm qmap01-log
::docker volume create qmap01-log
::
::docker volume rm qmap01-errors
::docker volume create qmap01-errors
::
::docker volume rm qmap01-trace
::docker volume create qmap01-trace
::
::docker run --net=mq-qmap01 -h qmap01a --ip=172.21.0.10 --network=mq-app1-app2 ^
:: yum install net-tools
::
::       -e MULTI=N ^
::       -e INST=0 ^
::
docker run -h qm-qmap01a --network=mq-qmap01 ^
       -d --ulimit nofile=10240:10240 ^
       --mount "type=bind,source=c:\Users\mickm\OneDrive\Documents\Development\Docker\mq-in-docker,destination=/home/mqm/scripts" ^
       --mount "type=volume,source=qmap01-qmgr,destination=/var/mqm" ^
       -e IBM_MQ_QUEUEMANAGER=QMAP01 -e IBM_MQ_LISTENER=1414 -e IBM_MQ_PER_CERT_EXPIRY=730 -e IBM_MQ_PER_CERT_SIZE=2048 ^
       -e COLD_QMGR=N ^
       -p 1461:1414 ^
       -p 18081:8081 ^
       -p 2222:9443 ^
       --name=qm-qmap01a ^
       mqqm:01
::docker logs qm-qmap01a
::
::
::docker run --rm --mount "type=volume,source=mqdata-qmap01-qmgr,destination=/var/mqm" ^
::        --mount "type=bind,source=C:\Users\mickm\OneDrive\Documents\Development\Docker\docker-qm\backup_volumes\QMAP01,destination=/backup" ^
::        ubuntu:16.04 bash -c "ls -lrt /var/mqm && cd /var/mqm && tar cvf /backup/qmap01.tar ."

::docker exec -it --mount "type=volume,source=mqdata-qmap01-qmgr,destination=/var/mqm" ^
::        --mount "type=bind,source=C:\Users\mickm\OneDrive\Documents\Development\Docker\docker-qm\backup_volumes\QMAP01,destination=/backup" ^
::        ubuntu:16.04 bash 

::        "cd /var/mqm && tar cvf /backup/qmap01.tar ."

::C:\Users\mickm\OneDrive\Documents\Development\Docker\docker-qm\backup_volumes\QMAP01