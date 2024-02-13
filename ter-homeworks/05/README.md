## Домашнее задание

https://github.com/netology-code/ter-homeworks/blob/main/05/hw-05.md

# Основная часть

## Задача 1

### tflint

> demonstration1

*Здесь необходимо выполнить terraform init*

![image](png/01-tflint-demonstration1.png)

> src

*Здесь 4 предупреждения, одно связано с необходимостью указать версию yandex провайдера и 3 остальных с объявленными, но неиспользуемыми переменными*

![image](png/01-tflint-src.png)

### checkov

> demonstration1:

Типы ошибок:

```
Check: CKV_TF_1: "Ensure Terraform module sources use a commit hash"
Check: CKV_YC_2: "Ensure compute instance does not have public IP."
Check: CKV_YC_11: "Ensure security group is assigned to network interface."
```

![image](png/01-chekov-demonstration1.png)

> src

Ошибок не найдено

![image](png/01-chekov-src.png)

## Задача 2

2. Предлагается повторить демонстрацию

