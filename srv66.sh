#!/bin/bash

# Добавление пользователя sshuser с UID 1010 и созданием группы
useradd sshuser -u 1010 -U

# Установка пароля для пользователя sshuser
echo "sshuser:P@ssw0rd" | chpasswd

# Добавление пользователя в группу wheel
usermod -aG wheel sshuser

# Добавление строки в /etc/sudoers
# Используем echo и tee для добавления строки в конец файла
echo "sshuser ALL=(ALL) NOPASSWD: ALL" | sudo tee -a /etc/sudoers > /dev/null

# Вывод сообщения об успешном завершении
echo "Пользователь sshuser успешно добавлен и настроен."
