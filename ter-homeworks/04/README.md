## Домашнее задание

https://github.com/netology-code/ter-homeworks/blob/main/04

# Основная часть

## Задача 1

Outputs

![image](png/01-outputs.png)

sudo nginx -t

![image](png/01-nginx.png)

Yandex Cloud hosts labels

![image](png/01-yc.png)

terraform console

![image](png/01-console.png)

## Задача 2

terraform console

![image](png/02-console.png)

Документация к модулю vpc: [README.md](src/modules/vpc/README.md)

## Задача 3
Список ресурсов в стейте
```
terraform state list
```
![image](png/03-state-list.png)

Удаляем из стейта все подключенные модули
```
terraform state rm module.vpc
terraform state rm module.marketing_vm
terraform state rm module.analytics_vm
```
![image](png/03-rm.png)

Восстанавливаем vpc в стейте
```
terraform import module.vpc.yandex_vpc_network.network enp693i3lgv9id7om51h
terraform import module.vpc.yandex_vpc_subnet.subnet e9bpa1s5eatlpdrrak7l
terraform state list
```
![image](png/03-restore-vpc.png)


Восстанавливаем vm в стейте
```
terraform import module.marketing_vm.yandex_compute_instance.vm[0] fhmkr940afk4s3iuf370
terraform import module.analytics_vm.yandex_compute_instance.vm[0] fhmj3amcjo79ofotrs4v
```
![image](png/03-restore-vm.png)

terraform plan
```
При восстановлении vm в стейте не восстанавливается allow_stopping_for_update = true, ставится null
```
![image](png/03-plan.png)


# Дополнительные задания

## Задача 4*
Cоздан модуль vpc2.

terraform plan
```
Не применяется, т.к. есть лимит на создаваемые сети.
```

![image](png/04-01.png)
![image](png/04-02.png)
![image](png/04-03.png)

## Задача 5*
ссылка на проект: [cluster](cluster/)

Практические руководства Managed Service for MySQL

https://cloud.yandex.ru/ru/docs/managed-mysql/tutorials/

Классы хостов MySQL (resource_preset_id)

https://cloud.yandex.ru/docs/managed-mysql/concepts/instance-types


Создаем кластер, ha = false

![image](png/05-add-cluster-01.png)
![image](png/05-add-cluster-02.png)

Создаем базу и пользователя

![image](png/05-add-db-user.png)

Yandex Cloud кластер

![image](png/05-yc-cluster-01.png)

Yandex Cloud свойство кластера

![image](png/05-yc-cluster-02.png)

Yandex Cloud база данных

![image](png/05-yc-db.png)

Добавляем еще один хост в кластер, ha = true

![image](png/05-ha-true-01.png)
![image](png/05-ha-true-02.png)

Yandex Cloud свойство кластера

![image](png/05-yc-cluster-03.png)

Yandex Cloud хосты кластера

![image](png/05-yc-cluster-04.png)



## Задача 6*
1.

## Задача 7*
ссылка на проект: [vault](vault/)

terraform output

![image](png/07-console.png)

new secret

![image](png/07-new-secret.png)

## Задача 8*
1.



```
p.s. После создания скриншотов вносил корректиировку в название модулей, возможно расхождение
```
