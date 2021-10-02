# Python Env

## Setup Pip

```bash
sudo apt update
sudo apt install python3-pip
pip3 --version
```

## Install Pipenv

```bash
sudo pip install pipenv
# or
sudo pip3 install pipenv
```

If `pipenv shell` is not making a new virtual env then log out of account and log in again. This will re-evaluate your `~/.profile`, which in turn automatically adds the `~/.local/bin` folder to your path. Or if we need the pipenv in just one terminal then without logging off we can hit `. ~/.profile`.

## Install Docker

#### Uninstall previous version

```bash
sudo apt-get remove docker docker-engine docker.io containerd runc
```

#### Setup the repo

```bash
sudo apt-get update

sudo apt-get install \
	apt-transport-https \
	ca-certificates \
	curl \
	gnupg \
	lsb-release
```

#### Add Docker GPG Key

```bash
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg
```

#### Setup stable repo

```bash
echo \
  "deb [arch=amd64 signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu \
  $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
```

#### Install Docker engine

```bash
sudo apt-get update
sudo apt-get install docker-ce docker-ce-cli containerd.io
```

#### Verify

```bash
~ : docker -v
Docker version 20.10.8, build 3967b7d
```

#### Add user to docker group

```bash
~ : docker info

Server:
ERROR: Got permission denied while trying to connect to the Docker daemon socket at unix:///var/run/docker.sock: Get "http://%2Fvar%2Frun%2Fdocker.sock/v1.24/info": dial unix /var/run/docker.sock: connect: permission denied
```

Then we do not have current user in docker group. Check with below command

```bash
~ : grep docker /etc/group
docker:x:998:

~ : echo $USER
himanshu
```

Current user not in docker group.

```bash
~ : sudo usermod -a -G docker $USER
~ : grep docker /etc/group
docker:x:998:himanshu
~ : newgrp docker

~ : docker info
Client:
 Context:    default
 Debug Mode: false
 Plugins:
  app: Docker App (Docker Inc., v0.9.1-beta3)
  buildx: Build with BuildKit (Docker Inc., v0.6.1-docker)
  scan: Docker Scan (Docker Inc., v0.8.0)

Server:
 Containers: 0
  Running: 0
  Paused: 0
  Stopped: 0
 Images: 0
 Server Version: 20.10.8
 Storage Driver: overlay2
  Backing Filesystem: extfs
  Supports d_type: true
  Native Overlay Diff: true
  userxattr: false
```
