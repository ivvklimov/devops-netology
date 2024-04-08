FROM centos:8

# Установка необходимых пакетов без вопросов
ENV TZ=UTC
# RUN dnf update && dnf --disablerepo '*' --enablerepo=extras swap centos-linux-repos centos-stream-repos
RUN sed -i 's/mirrorlist/#mirrorlist/g' /etc/yum.repos.d/CentOS-Linux-*
RUN sed -i 's|#baseurl=http://mirror.centos.org|baseurl=http://vault.centos.org|g' /etc/yum.repos.d/CentOS-Linux-*
RUN yum install -y epel-release && yum clean all
RUN yum install -y python3 python3-pip sudo openssh-server net-tools wget unzip tar telnet \
    && yum clean all

# Без данного файла не будет работать должным образом systemctl
COPY systemctl.py /usr/bin/systemctl
COPY systemctl.py /tmp/systemctl
RUN chmod a+x /usr/bin/systemctl && chmod a+x /tmp/systemctl
# RUN dos2unix /bin/systemctl

# Копируем entrypoint-скрипт в образ
COPY centos8/entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh
# RUN dos2unix /entrypoint.sh

# Запускаем команду по умолчанию при запуске контейнера
ENTRYPOINT []
CMD ["/entrypoint.sh"]
