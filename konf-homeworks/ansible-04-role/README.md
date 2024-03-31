## Домашнее задание

https://github.com/netology-code/mnt-homeworks/tree/MNT-video/08-ansible-04-role

## Inventory
[Inventory](playbook/inventory/prod.yml) состоит из виртуальных машин, запущенных в [docker](docker/docker-compose.yml).

[Образ](docker/centos/Dockerfile) для виртуальных машин построен на базе centos-7.

Centos, запущенная в docker имеет ограничения при работе с systemctl. Для того, чтобы обеспечить полноценную работу данной утилиты при сборке образа в него добавляется [systemctl.py](docker/systemctl.py)

Для запуска контейнеров используется [entrypoint.sh](docker/centos/entrypoint.sh), который создает пользователя ansible, добавляет его в sudo, по-необходимости создает серверные ssh ключи и запускает службу sshd. Для того, что каждый раз при перезапуске контейнеров не генерились новые серверные ssh ключи и не возникало сопутствующих сложностей с подключением по ssh в [docker-compose.yml](docker/docker-compose.yml) по месту хранения серверных ssh ключей монтируются тома, данные на которых сохраняются при перезапуске контейнеров.

## Playbook

[playbook](playbook/)


## Репозитории с ролями

[ansible-role-clickhouse](https://github.com/ivvklimov/ansible-role-clickhouse/tree/main)

[ansible-role-nginx](https://github.com/ivvklimov/ansible-role-nginx/tree/main)

[ansible-role-lighthouse](https://github.com/ivvklimov/ansible-role-lighthouse/tree/main)

[ansible-role-vector](https://github.com/ivvklimov/ansible-role-vector/tree/main)
