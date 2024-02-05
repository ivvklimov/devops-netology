FROM ubuntu:24.04

# Обновляем пакеты и устанавливаем необходимые зависимости
RUN apt-get update \
    && apt-get install -y python3 python3-pip \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# Запускаем команду по умолчанию при запуске контейнера
CMD ["tail", "-f", "/dev/null"]
