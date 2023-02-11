## _AIRFLOW_

```sh
docker run --user root -it --name airflow --hostname airflow --restart=always -v ~/airflow:/root/airflow -p 8080:8080 puckel/docker-airflow webserver
```
