@echo off
::
::
echo INFO: Build MQ Base image
echo -------------------------
::
setlocal
::
set MQIMAGE=mqadv_dev920_linux_x86-64.tar.gz
set MQBASEVER=2
::
echo MQ version       : %MQIMAGE%
echo MQ Image version : %MQBASEVER%
::
docker build --build-arg MQIMAGE=%MQIMAGE% --file .\mqbase\Dockerfile --tag mqbase:%MQBASEVER% .
::