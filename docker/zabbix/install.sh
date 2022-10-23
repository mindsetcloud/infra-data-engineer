```sh
# wget https://repo.zabbix.com/zabbix/6.2/ubuntu-arm64/pool/main/z/zabbix-release/zabbix-release_6.2-2%2Bubuntu22.04_all.deb
# dpkg -i zabbix-release_6.2-2+ubuntu22.04_all.deb
# apt update

# apt install zabbix-server-pgsql zabbix-frontend-php php8.1-pgsql zabbix-apache-conf zabbix-sql-scripts zabbix-agent

# sudo -u postgres createuser --pwprompt zabbix
# sudo -u postgres createdb -O zabbix zabbix

# zcat /usr/share/zabbix-sql-scripts/postgresql/server.sql.gz | sudo -u zabbix psql zabbix

vim /etc/zabbix/zabbix_server.conf

DBPassword=password

# systemctl restart zabbix-server zabbix-agent apache2
# systemctl enable zabbix-server zabbix-agent apache2

```
