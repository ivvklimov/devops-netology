FROM centos:7

# Установка необходимых пакетов без вопросов
ENV TZ=UTC
RUN yum install -y epel-release && yum clean all
RUN yum install -y python3 python3-pip sudo openssh-server net-tools wget unzip tar telnet \
    && yum clean all

# Без данного файла не будет работать должным образом systemctl
COPY systemctl.py /usr/bin/systemctl
RUN chmod a+x /usr/bin/systemctl
# RUN dos2unix /bin/systemctl

# Копируем entrypoint-скрипт в образ
COPY centos/entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh
# RUN dos2unix /entrypoint.sh

# Запускаем команду по умолчанию при запуске контейнера
ENTRYPOINT []
CMD ["/entrypoint.sh"]
