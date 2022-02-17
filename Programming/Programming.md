# Python Env

## Setup Pip

```bash
sudo apt update
sudo apt install python3-pip
pip3 --version
sudo apt-get install libpq-dev
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

## Install Docker Compose

- Run this command to download the current stable release of Docker Compose:
```
sudo curl -L "https://github.com/docker/compose/releases/download/1.29.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
```

- Apply executable permissions to the binary:
```
sudo chmod +x /usr/local/bin/docker-compose
```

- Test the installation.
```
docker-compose --version
```


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
```

OR

```bash
himanshu@WorkStation:/$ sudo -u postgres psql
[sudo] password for himanshu: 
psql (14.0 (Ubuntu 14.0-1.pgdg21.04+1))
Type "help" for help.

postgres=#
```

OR

```bash
himanshu@WorkStation:/$ psql -U postgres -h localhost
Password for user postgres: 
psql (14.0 (Ubuntu 14.0-1.pgdg21.04+1))
SSL connection (protocol: TLSv1.3, cipher: TLS_AES_256_GCM_SHA384, bits: 256, compression: off)
Type "help" for help.

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

Change your password

```bash
postgres=# ALTER USER postgres PASSWORD 'root@123';
ALTER ROLE
postgres=#
```

## Install PgAdmin 4

```bash
# Install the public key for the repository (if not done previously):
sudo curl https://www.pgadmin.org/static/packages_pgadmin_org.pub | sudo apt-key add

# Create the repository configuration file:
sudo sh -c 'echo "deb https://ftp.postgresql.org/pub/pgadmin/pgadmin4/apt/$(lsb_release -cs) pgadmin4 main" > /etc/apt/sources.list.d/pgadmin4.list && apt update'

# Install for both desktop and web modes:
sudo apt install pgadmin4
```

## Setup Ubuntu Server on Oracle VM and connect to VM via SSH on host.

1. Download Ubuntu ISO for Ubuntu Server from here https://ubuntu.com/download/server.
2. Download Oracle VM for respective OS https://www.virtualbox.org/wiki/Linux_Downloads.
3. Setup a new VM with the Ubuntu ISO and choose around 1GB of RAM and 15 GB fo Space.

<p align="center">
  <img src="vm_details.png">
</p>

4. Add a Host Network in VM. This network added in VM is also reflected in the host machine.
```bash
# install net-tools for ifconfig command
$ sudo apt install net-tools
```

<p align="center">
  <img src="host_network_adapter.png">
<!-- </p>
<p align="center"> -->
  <img src="host_network_dhcp.png">
</p>

Now after starting VM check, your host system will have below interface.

```bash
vboxnet0: flags=4163<UP,BROADCAST,RUNNING,MULTICAST>  mtu 1500
        inet 192.168.56.1  netmask 255.255.255.0  broadcast 192.168.56.255
        inet6 fe80::800:27ff:fe00  prefixlen 64  scopeid 0x20<link>
        inet6 fe80::800:27ff:fe00:0  prefixlen 64  scopeid 0x20<link>
        ether 0a:00:27:00:00:00  txqueuelen 1000  (Ethernet)
        RX packets 0  bytes 0 (0.0 B)
        RX errors 0  dropped 0  overruns 0  frame 0
        TX packets 75  bytes 12291 (12.2 KB)
        TX errors 0  dropped 0 overruns 0  carrier 0  collisions 0
```
Also we can check the ip address assigned to the VM by below method.
```bash
# in VM terminal
host1_user@host1server:~$ ip addr
1: lo: <LOOPBACK,UP,LOWER_UP> mtu 65536 qdisc noqueue state UNKNOWN group default qlen 1000
    link/loopback 00:00:00:00:00:00 brd 00:00:00:00:00:00
    inet 127.0.0.1/8 scope host lo
       valid_lft forever preferred_lft forever
    inet6 ::1/128 scope host 
       valid_lft forever preferred_lft forever
2: enp0s3: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 qdisc fq_codel state UP group default qlen 1000
    link/ether 08:00:27:76:f4:e9 brd ff:ff:ff:ff:ff:ff
    inet 10.0.2.15/24 brd 10.0.2.255 scope global dynamic enp0s3
       valid_lft 85365sec preferred_lft 85365sec
    inet6 fe80::a00:27ff:fe76:f4e9/64 scope link 
       valid_lft forever preferred_lft forever
3: enp0s8: <BROADCAST,MULTICAST> mtu 1500 qdisc noop state DOWN group default qlen 1000
    link/ether 08:00:27:8f:d0:98 brd ff:ff:ff:ff:ff:ff
```
See the last `enp0s8` this is the host only connection of VM with host machine.

Also add a rule in VM for port forwarding. Choose the port forwarding option on adapter1 of VM with NAT interface.

<p align="center">
  <img src="adapter1_nat.png">
<!-- </p>
<p align="center"> -->
  <img src="adapter1_post_forwarding.png">
</p>


4. Now connect with using the `ssh` command from host. But before this install `ssh-server` on both host and VM.
```bash
# install tool
$ sudo apt-get install openssh-server
# enable the ssh service by typing 
$ sudo systemctl enable ssh
# start the ssh service by typing 
$ sudo systemctl start ssh
# make sure ssh service is up and running on both host and VM
$ sudo systemctl status ssh
```
SSH from host to VM
```bash
# test it by login into the system using ssh user@server-name or ssh user@server-ip 
# add the specific port using -p flag
$ ssh host1_user@localhost -p 2222
# provide VM machine password
host1_user@host1server:~$   # connected
```
Here localhost will try to connect of port 2222 of 127.0.0.1 but that port is forwarded on port 22 of VM.
