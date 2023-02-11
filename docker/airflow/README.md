# AIRFLOW
## _Airflow_

[![Build Status](https://travis-ci.org/joemccann/dillinger.svg?branch=master)](https://nodesource.com/products/nsolid)

### install on ubuntu:
[ _shell_ ](https://github.com/mindsetcloud/infra-data-engineer/blob/main/docker/airflow/install.sh) - shell

### install within docker compose:
[ _docker-compose_ ](https://github.com/mindsetcloud/infra-data-engineer/blob/main/docker/airflow/airflow.yml) - docker-compose

### _install within dockerfile:_
[ _dockerfile_ ](https://github.com/mindsetcloud/infra-data-engineer/blob/main/docker/airflow/Dockerfile) - dockerfile

### _docker run:_

```sh
docker run --user root -it --name airflow --hostname airflow --restart=always \
-v ~/airflow:/root/airflow -p 8080:8080 puckel/docker-airflow webserver
```


