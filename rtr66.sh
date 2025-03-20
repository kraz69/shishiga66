#!/bin/bash

# Добавление пользователя net_admin с UID 1010
useradd net_admin -u 1010 -U

# Установка пароля для пользователя net_admin
echo "net_admin:P@$$word" | chpasswd

# Добавление пользователя в группу wheel (если необходимо)
usermod -aG wheel net_admin

# Добавление строки в /etc/sudoers
# Используем echo и tee для добавления строки в конец файла
echo "net_admin ALL=(ALL:ALL) NOPASSWD: ALL" | sudo tee -a /etc/sudoers > /dev/null

# Вывод сообщения об успешном завершении
echo "Пользователь net_admin успешно добавлен и настроен."
