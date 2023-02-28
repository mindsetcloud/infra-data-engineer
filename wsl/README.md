### Adicione as seguintes linhas no seu arquivo /etc/sudoers ou  visudo:
```sh
%sudo ALL=(ALL) NOPASSWD: /etc/init.d/service ssh start
%sudo ALL=(ALL) NOPASSWD: /etc/init.d/service docker start

```
### No seu arquivo do ~/.bashrc inclua o seguinte:

```sh
sudo service ssh start
sudo service docker start
```
