# mq-in-docker
--------------

Run MQ servers in Docker containers

## Scripts
----------------

All scripts are for Windows.

Docker builds are on Docker-for-Windows - all images have been tested on Windows and Linux

```
Client: Docker Engine - Community
 Cloud integration  0.1.18
 Version:           19.03.13
 API version:       1.40
 Go version:        go1.13.15
 Git commit:        4484c46d9d
 Built:             Wed Sep 16 17:00:27 2020
 OS/Arch:           windows/amd64
 Experimental:      false

Server: Docker Engine - Community
 Engine:
  Version:          19.03.13
  API version:      1.40 (minimum version 1.12)
  Go version:       go1.13.15
  Git commit:       4484c46d9d
  Built:            Wed Sep 16 17:07:04 2020
  OS/Arch:          linux/amd64
  Experimental:     false
 containerd:
  Version:          v1.3.7
  GitCommit:        8fba4e9a7d01810a393d5d25a3621dc101981175
 runc:
  Version:          1.0.0-rc10
  GitCommit:        dc9208a3303feef5b3839f4323d9beb36df0a9dd
 docker-init:
  Version:          0.18.0
  GitCommit:        fec3683
```

## MQ Base image
-----------------

An MQ base container can be created, using the `build-base.cmd` script.

## MQ Server
------------

An MQ server contain can be created, using the `build-qm.cmd` script

## MQ Processes
----------------

module | description
-------| ------------
amqzmuc0 | Critical process manager
amqzxma0 | Execution Controller
amqzfuma | OAM process
amqzlaa0 | LQM agents
amqzlsa0 | LQM agents
amqzmuf0 | Utility manager
amqzmur0 | Restartable process manager
amqzmgr0 | Process controller
amqfqpub | Publish Subscribe process
amqfcxba | Broker worker process
amqrmppa | Process pooling process
amqcrsta | Non-threaded responder job process
amqcrs6b | LU62 receiver channel and client connection
amqrrmfa | The repository process (for clusters)
amqzdmaa | Deferred message processor
amqpcsea | The command server
runmqtrm | Invoke a trigger monitor for a server
runmqdlq | Invoke dead-letter queue handler
runmqchi | The channel initiator process
runmqlsr | The channel listener process


