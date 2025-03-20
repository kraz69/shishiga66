#!/bin/bash

# Установка OpenSSH
apt-get update
apt-get install -y openssh-common
# Настройка конфигурационного файла sshd_config
{
    echo "Port 2024"
    echo "MaxAuthTries 2"
    echo "AllowUsers sshuser"
    echo "PermitRootLogin no"
} | sudo tee -a /etc/ssh/sshd_config > /dev/null

# Создание баннера
echo "Authorized access only" | sudo tee /root/banner > /dev/null
echo "" | sudo tee -a /root/banner > /dev/null  # Добавление пустой строки

# Установка настроек службы SSH
systemctl enable --now ssh
systemctl restart ssh

# Вывод сообщения об успешном завершении
echo "SSH настроен и служба перезапущена."

