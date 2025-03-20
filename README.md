
## isp

timedatectl set-timezone Asia/Vladivostok

apt-get update

apt-get install wget

wget https://raw.githubusercontent.com/kraz69/shishiga66/refs/heads/main/i66.sh

chmod +x ./i66.sh

./i66.sh

## hq-rtr

timedatectl set-timezone Asia/Vladivostok

echo 172.16.4.4/28 > /etc/net/ifaces/ens18/ipv4address 

echo default via 172.16.4.1 > /etc/net/ifaces/ens18/ipv4route

echo "TYPE=eth" > /etc/net/ifaces/ens18/options

echo -e "nameserver 8.8.8.8" > /etc/net/ifaces/ens18/resolv.conf

systemctl restart network

sed -i 's/net.ipv4.ip_forward = 0/net.ipv4.ip_forward = 1/g' /etc/net/sysctl.conf

iptables -t nat -A POSTROUTING -j MASQUERADE

iptables-save >> /etc/sysconfig/iptables

systemctl enable iptables

systemctl restart iptables

service iptables enable

apt-get update

apt-get install wget

wget https://raw.githubusercontent.com/kraz69/shishiga66/refs/heads/main/hq66.sh

chmod +x ./hq66.sh

./hq66.sh

## br-rtr

timedatectl set-timezone Asia/Vladivostok

echo "172.16.5.5/28" > /etc/net/ifaces/ens18/ipv4address

echo "default via 172.16.5.1" > /etc/net/ifaces/ens18/ipv4route

echo "TYPE=eth" > /etc/net/ifaces/ens18/options

echo -e "nameserver 8.8.8.8" > /etc/net/ifaces/ens18/resolv.conf

systemctl restart network

sed -i 's/net.ipv4.ip_forward = 0/net.ipv4.ip_forward = 1/g' /etc/net/sysctl.conf

iptables -t nat -A POSTROUTING -j MASQUERADE


iptables-save >> /etc/sysconfig/iptables


systemctl enable iptables

systemctl restart iptables

service iptables enable

apt-get update

apt-get install wget 

wget https://raw.githubusercontent.com/kraz69/shishiga66/refs/heads/main/b_rt66.sh

chmod +x ./b_rt66.sh

./b_rt66.sh

## BR-SRV

timedatectl set-timezone Asia/Vladivostok

hostnamectl set-hostname br-srv.au-team.irpo; exec bash

echo -e "BOOTPROTO=static \nTYPE=eth" > /etc/net/ifaces/ens18/options 

echo 192.168.3.10/27> /etc/net/ifaces/ens18/ipv4address 

echo default via 192.168.3.1> /etc/net/ifaces/ens18/ipv4route

echo -e "search au-team.irpo \nnameserver 192.168.1.10" > /etc/net/ifaces/ens18/resolv.conf

systemctl restart network

## hq - cli 

timedatectl set-timezone Asia/Vladivostok

hostnamectl set-hostname hq-cli.au-team.irpo; exec bash

systemctl restart network

## hq-srv

timedatectl set-timezone Asia/Vladivostok

hostnamectl set-hostname hq-srv.au-team.irpo; exec bash

echo -e "BOOTPROTO=static \nTYPE=eth" > /etc/net/ifaces/ens18/options

echo 192.168.1.10/26 > /etc/net/ifaces/ens18/ipv4address 

echo "nameserver 8.8.8.8" > /etc/resolv.conf

echo default via 192.168.1.1> /etc/net/ifaces/ens18/ipv4route


systemctl restart network

apt-get update

apt-get install wget

wget https://raw.githubusercontent.com/kraz69/shishiga66/refs/heads/main/hqsrv66DNS.sh

chmod +x ./hqsrv66DNS.sh

./hqsrv66DNS.sh

## RTR acc
wget https://raw.githubusercontent.com/kraz69/shishiga66/refs/heads/main/rtr66.sh

chmod +x ./rtr66.sh

./rtr66.sh

## srv acc

wget https://raw.githubusercontent.com/kraz69/shishiga66/refs/heads/main/srv66.sh

chmod +x ./srv66.sh

./srv66.sh

## ssh srv

wget https://raw.githubusercontent.com/kraz69/shishiga66/refs/heads/main/sshdd66srv.sh

chmod +x ./sshdd66srv.sh

./sshdd66srv.sh
## RTR OSPF 



