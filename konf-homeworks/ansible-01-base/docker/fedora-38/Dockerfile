FROM fedora:38

# Обновляем пакеты и устанавливаем необходимые зависимости
RUN dnf -y update \
    && dnf install -y python3 python3-pip \
    && dnf clean all

# Запускаем команду по умолчанию при запуске контейнера
CMD ["tail", "-f", "/dev/null"]
