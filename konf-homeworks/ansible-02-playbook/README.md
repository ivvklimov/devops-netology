## Домашнее задание

https://github.com/netology-code/mnt-homeworks/tree/MNT-video/08-ansible-02-playbook

# Основная часть

## Inventory
[Inventory](playbook/inventory/prod.yml) состоит из виртуальных машин, запущенных в [docker](docker/docker-compose.yml).

[Образ](docker/centos/Dockerfile) для виртуальных машин построен на базе centos-7.

Centos, запущенная в docker имеет ограничения при работе с systemctl. Для того, чтобы обеспечить полноценную работу данной утилиты при сборке образа в него добавляется [systemctl.py](docker/systemctl.py)

## Ссылка на плейбук
[vector.yml](playbook/vector.yml)

## Параметры плейбука
vector_version
```
Версия вектора, например:
vector_version: "0.36.0"
```

vector_config_dir
```
Папка, в которой будет находится конфиг вектора, например:
vector_config_dir: "{{ ansible_user_dir }}/vector_config"
```

## Теги плейбука
В данном плейбуке теги отсутствуют.

## Задачи плейбука
**Download Vector**

- Скачиваем вектор в /tmp, версия берется из параметра vector_version, попутно переименовываем архив

**Unarchive Vector**

- Распаковываем архив с вектором в /tmp


**Copy vector to /usr/bin**

- Копируем бинарник в /usr/bin/vector, также делаем его испоняемым


**Configure Vector | Ensure what directory exists**

- Для работы вектора нужна эта папка /var/lib/vector, создаем


**Configure Vector | Ensure what directory exists**

- Создаем папку, где будет лежать конфиг для вектора, папку берем из параметра vector_config_dir


**Configure Vector | Template config**

- Собираем конфиг для вектора на базе jinja2 шаблона и кладем по указанному пути.

- Подключаем хук, который будет перезапускать вектор при изменениях в его конфиге.


**Configure Service | Template systemd unit**

- Собираем файл для службы вектора на базе jinja2 шаблона и кладем по указанному пути.

- Подключаем хук, который будет перезапускать вектор при изменениях в параметрах службы.

## Хуки плейбука
**Restart vector service**

- Перезапускает службу вектора.
- Аналог на bash: *sudo systemctl restart vector*


## Screenshots

ansible-lint vector.yml

![image](png/ansible-lint.png)

ansible-playbook -i inventory/prod.yml vector.yml --check

![image](png/ansible%20check.png)

ansible-playbook -i inventory/prod.yml vector.yml --diff

![image](png/ansible%20diff.png)
