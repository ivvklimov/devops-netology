#!/bin/bash

if [ ! -f /etc/ssh/ssh_host_key ]; then
    ssh-keygen -A
fi

# Создаем пользователя ansible
useradd -m -s /bin/bash ansible
# Задаем пароль для пользователя ansible
echo 'ansible:ansible' | chpasswd
# Задаем права на папку пользователю
chown -R ansible:ansible /home/ansible
# Добавляем пользователя ansible в группу sudo
usermod -aG wheel ansible

# Задаем приглашение в bash
echo 'export PS1="\u@\h:\w\$ "' >> /home/ansible/.bash_profile

# Запускаем SSH-сервер
systemctl start sshd

tail -f /dev/null
