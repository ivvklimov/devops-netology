## Домашнее задание

https://github.com/netology-code/ter-homeworks/blob/main/05/hw-05.md

# Основная часть

## Задача 1

### tflint

> [demonstration1](01/demonstration1/)

*Здесь необходимо выполнить terraform init*

![image](png/01-tflint-demonstration1.png)

> [src](01/src/)

*Здесь 4 предупреждения, одно связано с необходимостью указать версию yandex провайдера и 3 остальных с объявленными, но неиспользуемыми переменными*

![image](png/01-tflint-src.png)

### checkov

> [demonstration1](01/demonstration1/)

Типы ошибок:

```
Check: CKV_TF_1: "Ensure Terraform module sources use a commit hash"
Check: CKV_YC_2: "Ensure compute instance does not have public IP."
Check: CKV_YC_11: "Ensure security group is assigned to network interface."
```

![image](png/01-chekov-demonstration1.png)

> [src](01/src/)

Ошибок не найдено

![image](png/01-chekov-src.png)

## Задача 2

В 4 задании было реализовано несколько проектов. Возьму тот, который создает marketing-web и analytics_vm и перенесу его стейт в S3. В следующем задании сделаю hotfix на данный проект по результатам работы tflint и checkov.

Для этого скопирую папку проекта ([src](../04/src/)) из домашнего задания 4 в папку ([src](src/)) текущего домашнего задания 5.

В Yandex Cloud создаем сервисный аккаунт **tfstate** и добавляем к нему роли

![image](png/02-yc-service-accaunt.png)

Создаем статический ключ доступа

*Будет использоваться при описании **backend "s3"** в terraform*

![image](png/02-yc-service-key.png)

Для созданного аккаунта выдаем права на бакет

![image](png/02-yc-bucket-acl.png)

Создадим файл secret.backend.tfvars и пропишем туда access_key и secret_key с данными статического ключа, сформированного ранее.

Подключим файл с секретами backend при инициализации инфраструктуры:
```
terraform init -backend-config=secret.backend.tfvars
```
*При этом terraform подгрузит все параметры, описанные в -backend-config, внутрь блока backend.*

После данной процедуры локальный стейт очищается и он появляется в S3:

![image](png/02-yc-terraform-state.png)

### Настраиваем блокировку стейта

Создаем базу данных YDB

![image](png/02-yc-ydb.png)

Создаем таблицу

![image](png/02-yc-ydb-table.png)

Добавляем настройки в **backend "s3"**

![image](png/02-dynamodb.png)

Перенастраиваем стейт

```
terraform init -migrate-state -backend-config=secret.backend.tfvars
```

![image](png/02-state-reconfigure.png)

Запускаем консоль terraform в первом терминале

```
terraform console
```

![image](png/02-terraform-console-01.png)

Запускаем консоль terraform во втором терминале и видим сообщение, что стейт заблокирован

```
terraform console
```

![image](png/02-terraform-console-02.png)


Во втором терминале принудительно разблокируем стейт и войдем в консоль terraform

```
terraform force-unlock eadbdc31-93b1-8176-3a02-5467fd70a2c6
terraform console
```

![image](png/02-terraform-console-02-unlock.png)

В первом терминале нажимаем Ctrl+C и видим сообщение, что стейт был заблокирован

![image](png/02-terraform-console-01-lock.png)

В момент, когда стейт заблокирован, в нашей таблице в YDB появляется соответствующая информация

![image](png/02-yc-ydb-table-select.png)

## Задача 3

Из ветки ter-05 создаем ветку ter-05-hotfix

Переходим в корень проекта terraform [src](src)

Создаем файл [.tflint.hcl](01/src/.tflint.hcl)

Запускаем проверку **tflint**

```
docker run --rm -v "$(pwd):/tflint" ghcr.io/terraform-linters/tflint --chdir /tflint
```

Получаем список предупреждений

![image](png/03-error-tflint.png)

Запускаем проверку **checkov**

```
docker run --rm --tty --volume $(pwd):/tf --workdir /tf bridgecrew/checkov \
--download-external-modules true --directory /tf
```

Получаем список предупреждений

![image](png/03-error-checkov-01.png)
![image](png/03-error-checkov-02.png)
![image](png/03-error-checkov-03.png)

### Некоторые комментарии к ошибкам

Описание ошибок **checkov**

https://www.checkov.io/5.Policy%20Index/terraform.html

**Check: CKV_YC_2: "Ensure compute instance does not have public IP."**
https://github.com/bridgecrewio/checkov/blob/main/checkov/terraform/checks/resource/yandexcloud/ComputeVMPublicIP.py

*Если нам необходим внешний доступ, то мы можем проигнорировать предупреждение CKV_YC_2. Предупреждение связано с тем, что включенная опция nat может повлечь за собой риски безопасности, но если мы осознанно приняли это решение и наша конфигурация работает в рамках наших требований, то предупреждение можно проигнорировать.*

**Check: CKV_YC_11: "Ensure security group is assigned to network interface."**
https://github.com/bridgecrewio/checkov/blob/main/checkov/terraform/checks/resource/yandexcloud/ComputeVMSecurityGroup.py

*Для виртуальных машин необходимо задать группу безопасности.*

После внесения правок повторная проверка **tflint** не показывает замечаний

![image](png/03-error-tflint-fixed.png)

Проверка с помощью **checkov** также показывает успешное завершение

![image](png/03-error-checkov-fixed.png)

```
terraform plan
```

![image](png/03-terraform-plan-01.png)
![image](png/03-terraform-plan-02.png)
![image](png/03-terraform-plan-03.png)

Ссылка на Pull Request: [Fixed tflint and checkov warnings](https://github.com/ivvklimov/devops-netology/pull/16)

## Задача 4

Cсылка на проект: [validation](validation/variables.tf)

IP success

![image](png/04-ip-success.png)

IP error

![image](png/04-ip-error.png)

IP list success

![image](png/04-ip-list-success.png)

IP list error

![image](png/04-ip-list-error.png)

# Дополнительные задания

## Задача 5*

Cсылка на проект: [validation](validation/variables.tf)

Any string success

![image](png/05-any-string-success.png)

Any string error

![image](png/05-any-string-error.png)

Only one success

![image](png/05-only-one-success.png)

Only one error

![image](png/05-only-one-error.png)

Both success

![image](png/05-both-success.png)

Both error

![image](png/05-both-error.png)

## Задача 6*

Полезная информация с канала **Yandex Cloud**: [CI/CD в Облаке с помощью GitLab](https://www.youtube.com/watch?v=L2G85V4WH2k)

## Задача 7*

[ydb-s3-tfstate](07/modules/ydb-s3-tfstate) - модуль для создания сервисного аккаунта с нужными ролями, также он создает S3 бакет для хранения стейта и создает YDB, в которой уже через gui надо создать нужную таблицу для хранения данных о блокировке, т.к. соответствующее api яндексом пока не реализовано.

[s3-init](07/s3_init/) - проект, который с помощью [ydb-s3-tfstate](07/modules/ydb-s3-tfstate) производит соответствующие настройки

[test](07/test/) - тестовый проект, который работает с удаленным стейтом и блокировками

### Создание инфраструктуры

Перейти в проект s3_init
```
terraform init
terraform apply
yes

в gui Перейти в:
Managed Service for YDB
  - Базы данных
    - ter-05-task-07

Создать - Таблицу - Документальная таблица
Оставить одну колонку, переименовать ее в LockID
Таблицу назвать tfstate-dev

terraform output access_key
terraform output secret_key
terraform output ydb_api
```

Перейти в проект test
```
Заполнить данные в secret.backend.tfvars из terraform output выше
terraform init -reconfigure -backend-config=secret.backend.tfvars
terraform apply
yes

```
*Cтейт в бакете создается, при этом никакие роли на него не назначены,
блокировка в таблице также появляется.*

### Удаление инфраструктуры

Перейти в проект test
```
terraform destroy
yes
```

Очистка бакета
```
terraform destroy в s3_init не сможет удалить бакет, если в нем будут данные.

Поэтому заходим в gui и последовательно удаляем все данные из созданного бакета.
```

Перейти в проект s3_init
```
terraform destroy
yes
```

*В коде модуля [ydb-s3-tfstate](07/modules/ydb-s3-tfstate) приведены комментарии* на разные части его функционала.
