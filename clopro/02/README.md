## Домашнее задание

https://github.com/netology-code/clopro-homeworks/blob/main/15.2.md


# Задание 1: Yandex Cloud

Разворачиваем инфраструктуру

```
terraform init
terraform apply
```

Outputs

![image](png/outputs.png)

Бакет

![image](png/bucket.png)

Ссылка для скачивания: \
https://storage.yandexcloud.net/ivvklimov-netology-bucket/nature.png


VM

```
Хосты развернуты в приватной сети без доступа к инету, доступ к ним будет осуществляться через балансировщик.
```

![image](png/vm.png)


Балансировщик и целевая группа

![image](png/lb.png)

Пробуем открыть картинку, на данный момент за балансировщиком у нас 3 запущенных хоста

![image](png/web.png)

Останавливаем одну VM

![image](png/vm-stopped.png)

И повторно пробуем открыть картинку, на данный момент за балансировщиком у нас 2 запущенных хоста

![image](png/web.png)

Картинка открывается
