### Adicione as seguintes linhas no seu arquivo /etc/sudoers ou  visudo:
```sh
username ALL=NOPASSWD: /usr/sbin/service ssh start
username ALL=NOPASSWD: /usr/sbin/service docker start

```
### No seu arquivo do ~/.bashrc inclua o seguinte:

```sh
sudo service ssh start
sudo service docker start
```
