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

```bash
himanshu@WorkStation:~$ sudo docker info
Client:
 Context:    default
 Debug Mode: false
 Plugins:
  app: Docker App (Docker Inc., v0.9.1-beta3)
  buildx: Build with BuildKit (Docker Inc., v0.6.3-docker)
  scan: Docker Scan (Docker Inc., v0.8.0)

Server:
 Containers: 1
  Running: 0
  Paused: 0
  Stopped: 1
 Images: 1
 Server Version: 20.10.9
```

#### Make current user a member in docker group

```bash
groups
sudo usermod -aG docker $USER
exec su -l $USER
docker ps
```

Restart the whole system and use `docker info` command without sudo.


## Install PostgreSQL

```bash
sudo sh -c 'echo "deb http://apt.postgresql.org/pub/repos/apt $(lsb_release -cs)-pgdg main" > /etc/apt/sources.list.d/pgdg.list'
wget --quiet -O - https://www.postgresql.org/media/keys/ACCC4CF8.asc | sudo apt-key add -
sudo apt-get update
sudo apt-get -y install postgresql
```

Enter PostgreSQL

```bash
himanshu@WorkStation:/$ sudo su postgres
postgres@WorkStation:/$ psql
psql (14.0 (Ubuntu 14.0-1.pgdg21.04+1))
Type "help" for help.

postgres=# 
postgres=# 
```

See databases and users

```psql
postgres=# 
postgres=# \l
                             List of databases
   Name    |  Owner   | Encoding | Collate | Ctype |   Access privileges   
-----------+----------+----------+---------+-------+-----------------------
 postgres  | postgres | UTF8     | en_IN   | en_IN | 
 template0 | postgres | UTF8     | en_IN   | en_IN | =c/postgres          +
           |          |          |         |       | postgres=CTc/postgres
 template1 | postgres | UTF8     | en_IN   | en_IN | =c/postgres          +
           |          |          |         |       | postgres=CTc/postgres
(3 rows)

postgres=# 
postgres=# 
postgres=# 
postgres=# \du
                                   List of roles
 Role name |                         Attributes                         | Member of 
-----------+------------------------------------------------------------+-----------
 postgres  | Superuser, Create role, Create DB, Replication, Bypass RLS | {}
```
