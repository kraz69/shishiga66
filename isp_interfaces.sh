#!/bin/bash

# Установка имени хоста
hostnamectl set-hostname isp.au-team.irpo

# Переход в директорию с конфигурацией сетевых интерфейсов
cd /etc/net/ifaces

# Создание конфигурации для интерфейса ens19
md ens19
echo -e "BOOTPROTO=static\nTYPE=eth" > /etc/net/ifaces/ens19/options
echo 172.16.4.1/28 > /etc/net/ifaces/ens19/ipv4address

# Создание конфигурации для интерфейса ens20
md ens20
echo -e "BOOTPROTO=static\nTYPE=eth" > /etc/net/ifaces/ens20/options
echo 172.16.5.1/28 > /etc/net/ifaces/ens20/ipv4address

# Перезапуск сетевой службы
systemctl restart network

# Включение IP-маршрутизации
sed -i 's/net.ipv4.ip_forward = 0/net.ipv4.ip_forward = 1/g' /etc/net/sysctl.conf

#install iptables
apt-get install iptables

# Настройка NAT с помощью iptables
iptables -t nat -A POSTROUTING -s 172.16.4.0/28 -o ens18 -j MASQUERADE
iptables -t nat -A POSTROUTING -s 172.16.5.0/28 -o ens18 -j MASQUERADE

# Сохранение правил iptables
iptables-save > /etc/sysconfig/iptables

# Включение службы iptables
systemctl enable iptables
