### Adicione as seguintes linhas no seu arquivo /etc/sudoers ou  visudo:
```sh
%sudo ALL=(ALL) NOPASSWD: /etc/init.d/service start ssh
%sudo ALL=(ALL) NOPASSWD: /etc/init.d/service start docker

```
### No seu arquivo do ~/.bashrc inclua o seguinte:

```sh
sudo service start ssh
sudo service start docker
```
