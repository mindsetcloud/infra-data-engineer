### Adicione as seguintes linhas no seu arquivo /etc/sudoers ou  visudo:
```sh
%sudo ALL=NOPASSWD: /etc/init.d/mysql
%sudo ALL=NOPASSWD: /etc/init.d/nginx
%sudo ALL=NOPASSWD: /etc/init.d/php7.2-fpm
```
### E no seu arquivo do ~/.bashrc inclua o seguinte:

```sh
sudo /etc/init.d/nginx start
sudo /etc/init.d/mysql start
sudo /etc/init.d/php7.2-fpm start
```
