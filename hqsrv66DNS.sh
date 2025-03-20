#!/bin/bash

# Настройка файла /etc/resolv.conf
echo "nameserver 8.8.8.8" > /etc/resolv.conf
echo "search au-team.irpo" >> /etc/resolv.conf
echo "nameserver 192.168.1.10" >> /etc/resolv.conf

# Обновление списка пакетов
apt-get update

# Установка dnsmasq
apt-get install -y dnsmasq

# Включение и запуск dnsmasq
systemctl enable --now dnsmasq

# Настройка файла /etc/dnsmasq.conf
{
    echo "no-resolv"
    echo "domain=au-team.irpo"
    echo "server=8.8.8.8"
    echo "interface=ens18"
    echo "address=/hq-rtr.au-team.irpo/192.168.1.1"
    echo "ptr-record=1.1.168.192.in-addr.arpa,hq-rtr.au-team.irpo"
    echo "cname=moodle.au-team.irpo,hq-rtr.au-team.irpo"
    echo "cname=wiki.au-team.irpo,hq-rtr.au-team.irpo"
    echo "address=/br-rtr.au-team.irpo/192.168.4.1"
    echo "address=/hq-srv.au-team.irpo/192.168.1.2"
    echo "ptr-record=2.1.168.192.in-addr.arpa,hq-srv.au-team.irpo"
    echo "address=/hq-cli.au-team.irpo/192.168.2.10"
    echo "ptr-record=2.2.168.192.in-addr.arpa,hq-cli.au-team.irpo"
    echo "address=/br-srv.au-team.irpo/192.168.4.2"
} > /etc/dnsmasq.conf

# Настройка файла /etc/hosts
echo "192.168.1.10 hq-rtr.au-team.irpo" >> /etc/hosts

# Перезапуск службы dnsmasq
systemctl restart dnsmasq
