FROM centos:7

# Обновляем пакеты и устанавливаем необходимые зависимости
RUN yum update -y \
    && yum install -y python3 python3-pip \
    && yum clean all

# Запускаем команду по умолчанию при запуске контейнера
CMD ["tail", "-f", "/dev/null"]
