## Задача 1
Созданный образ в консоле

![image](png/01-01.png)

Созданный образ из личного кабинета Yandex Cloud

![image](png/01-02.png)

## Задача 2 (2.1, 2.2*)
terraform init

![image](png/02-02-terraform-init.png)

terraform apply

![image](png/02-02-terraform-apply.png)

Свойства ноды в Yandex Cloud

![image](png/02-02.png)

## Задача 3
docker ps

![image](png/03-docker_ps.png)

Также на стек развернут Portainer

![image](png/03-portainer.png)

## Задачи 4, 5*
Предложенный стек был переработан:

```
1. Хосты развернуты на базе debian-11
2. Обновлен плейбук ansible для разворачивания docker, docker-compose на debian
3. Обновлены grafana, prometheus (т.к. не поддерживает синтаксис запросов, используемых в новом дашборде) и node-exporter
4. В grafana добавлен новый dashboard Node Exporter Full: https://grafana.com/grafana/dashboards/1860-node-exporter-full/
5. Добавлен Portainer для работы с docker
6. Убран caddy (т.к. контейнер с ним не запускается, падает с ошибками про go)
```

Ноды в Yandex Cloud

![image](png/05-01.png)

Статистика node01 в grafana, дашборд Node Exporter Full

![image](png/05-02.png)

Статистика node02 в grafana, дашборд Node Exporter Full

![image](png/05-03.png)

Список хостов в выпадающем списке дашборда

![image](png/05-04.png)
