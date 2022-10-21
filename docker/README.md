## install docker

``` sh

sudo apt-get update

sudo apt-get install \
    ca-certificates \
    curl \
    gnupg \
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
sudo apt-get update
    
```

``` sh
sudo chmod a+r /etc/apt/keyrings/docker.gpg
sudo apt-get update
    
```

``` sh
sudo apt-get install docker-ce docker-ce-cli containerd.io docker-compose-plugin
    
```

