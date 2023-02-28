```sh
docker network create -d macvlan \
  --subnet=192.168.100.0/24 \
  --ip-range=192.168.100.128/25 \
  --gateway=192.168.100.34 \
  --aux-address="msc-router=192.168.100.129" \
  -o parent=eth0 mindsetcloud-net
```
