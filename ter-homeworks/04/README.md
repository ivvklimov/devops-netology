## Домашнее задание

https://github.com/netology-code/ter-homeworks/blob/main/04/hw-04.md

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
Cсылка на проект: [cluster](cluster/)

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
Cсылка на проект: [s3](s3/)

При запуске terraform init возникает ошибка

![image](png/06-error-terraform-init.png)

Нашел первую версию яндекс провайдера, на базе которого можно создать бакет s3 с помощью заданного модуля. v0.92.0, там такая же ошибка, что и на последней версии. Посмотрел некоторые промежуточные версии до последней, таже ошибка.

![image](png/06-error-yp-0-92-0.png)

На v0.91.0 другая ошибка

![image](png/06-error-yp-0-91-0.png)

Далее попробовал предыдущую версию модуля относительно коммита тега, такая же ошибка.

![image](png/06-error-module-1-0-0.png)

У данного модуля есть открытый ишью с такой проблемой:

https://github.com/terraform-yc-modules/terraform-yc-s3/issues/5

```
Далее, по-необходимости, бакет будет создан через gui Yandex Cloud
```

## Задача 7*
Cсылка на проект: [vault](vault/)

terraform output

![image](png/07-console.png)

new secret

![image](png/07-new-secret.png)

## Задача 8*
Cсылка на проект: [remote_state](remote_state/)

Т.к. в задаче 6* s3 модуль не смог создать бакет, создаем его через gui Yandex Cloud. В каждом модуле, который будет работать с S3 создадим файл secret.backend.tfvars и пропишем туда access_key и secret_key.

Подключим файл с секретами backend при инициализации инфраструктуры:
```
terraform init -backend-config=secret.backend.tfvars
```
*При этом terraform подгрузит все параметры, описанные в -backend-config, внутрь блока backend.*

Содержимое бакета в S3 Yandex Cloud

![image](png/08-s3-bucket.png)

Сохраненный стейт layer1-network

![image](png/08-s3-network.png)

Сохраненный стейт layer2-servers

![image](png/08-s3-servers.png)

```
p.s. После создания скриншотов вносил корректиировку в название модулей, возможно расхождение
```
