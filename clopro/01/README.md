## Домашнее задание

https://github.com/netology-code/clopro-homeworks/blob/main/15.1.md


# Задание 1: Yandex Cloud

Разворачиваем инфраструктуру

```
terraform init
terraform apply
```

![image](png/outputs.png)

Подсети

![image](png/gui-subnets.png)

Таблица маршрутизации

![image](png/gui-nat.png)

Подключаемся к public-vm через ее внешний ip и пингуем yandex.ru

![image](png/public-ping.png)

Подключаемся к private-vm через public-vm и пингуем yandex.ru

![image](png/private-ping.png)

private-vm получает доступ в инет через nat
