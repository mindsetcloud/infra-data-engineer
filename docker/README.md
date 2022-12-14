# DOCKER
## _install docker on ubuntu_

[![Build Status](https://travis-ci.org/joemccann/dillinger.svg?branch=master)](https://nodesource.com/products/nsolid)

``` sh

sudo apt-get update

sudo apt-get install \
    ca-certificates \
    curl \
    gnupg \
    software-properties-common \
    apt-transport-https \
    lsb-release
    
```

``` sh

sudo mkdir -p /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
    
```

``` sh

echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
  $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
    
```

``` sh
sudo add-apt-repository "deb [arch=$(dpkg --print-architecture)] https://download.docker.com/linux/ubuntu focal stable"
sudo apt-get update
    
```

``` sh
apt-cache policy docker-ce
sudo chmod a+r /etc/apt/keyrings/docker.gpg
sudo apt-get update
    
```

``` sh
sudo apt-get install docker-ce docker-ce-cli containerd.io docker-compose-plugin
    
```

``` sh
sudo usermod -aG docker ${USER}
```

