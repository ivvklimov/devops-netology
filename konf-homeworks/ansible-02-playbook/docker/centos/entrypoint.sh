#!/bin/bash

# Проверяем наличие пользователя ansible
if id "ansible" &>/dev/null; then
    echo "User ansible already exists"
else
    # Создаем пользователя ansible
    useradd -m -s /bin/bash ansible
    # # # Добавляем пользователя ansible в группу sudo
    usermod -aG wheel ansible
    # Задаем пароль для пользователя ansible
    echo 'ansible:ansible' | chpasswd

    # Генерируем ключи хоста для SSH
    ssh-keygen -A
fi

echo 'export PS1="\u@\h:\w\$ "' >> /home/ansible/.bash_profile
chown -R ansible:ansible /home/ansible
# Дополнительные действия по настройке контейнера

# Запуск остальных команд или сервисов
exec "$@"

# Запускаем SSH-сервер
/usr/sbin/sshd

tail -f /dev/null
