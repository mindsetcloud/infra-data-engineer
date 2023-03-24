### show ip address interfaces
```sh

ip addr

```
### create network macvlan with docker
```sh
docker network create -d macvlan \
  --subnet=172.27.136.42/20 \
  --ip-range=172.27.142.0/24 \
  --gateway=172.27.128.1 \
  --aux-address="msc-router=172.27.142.1" \
  -o parent=eth0 msc-macvlan

```
### link macvlan interface
```sh
sudo ip link add msc-macvlan link eth0 type macvlan mode bridge
sudo ip addr add 172.27.142.1/24 dev msc-macvlan
sudo ifconfig msc-macvlan up
```

```
docker network create --driver=bridge --subnet=192.168.32.0/16 --ip-range=192.168.32.0/24 --gateway=192.168.32.1 mindsetcloud-nt
```
reference: https://dockerlabs.collabnix.com/beginners/macvlan-010.html
