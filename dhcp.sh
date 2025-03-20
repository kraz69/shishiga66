#!/bin/bash

# Установка dnsmasq
apt-get install -y dnsmasq


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

#запуск службы
systemctl enable dnsmasq --now

# Проверка статуса службы dnsmasq
systemctl status dnsmasq
