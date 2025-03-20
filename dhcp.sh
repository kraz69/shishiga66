#!/bin/bash

# Установка dnsmasq
apt install -y dnsmasq

# Создание резервной копии конфигурационного файла
cp /etc/dnsmasq.conf /etc/dnsmasq.conf.bak

# Внесение настроек в конфигурационный файл
{
    echo "port=0"
    echo "interface=vlan200"
    echo "listen-address=192.168.2.1"
    echo "dhcp-authoritative"
    echo "dhcp-range=interface:vlan200,192.168.2.2,192.168.2.14,255.255.255.240,6h"
    echo "dhcp-host=id:01:11:11:11:11:11:11,192.168.2.10"
    echo "dhcp-option=6,192.168.1.10"
    echo "leasefile-ro"
} > /etc/dnsmasq.conf

# Перезапуск службы dnsmasq
systemctl restart dnsmasq

# Проверка статуса службы dnsmasq
systemctl status dnsmasq
