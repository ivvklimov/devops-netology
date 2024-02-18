# -------------------------------------
# Создание сервисного аккаунта
# https://cloud.yandex.ru/ru/docs/iam/operations/sa/create
# yc iam service-account list
resource "yandex_iam_service_account" "sa" {
  name        = var.sa_name
  description = "Terraform managed"
}

# -------------------------------------
# Настройка прав доступа к каталогу
# https://cloud.yandex.ru/ru/docs/resource-manager/operations/folder/set-access-bindings
resource "yandex_resourcemanager_folder_iam_binding" "storage-editor" {
  folder_id = var.folder_id
  role      = "storage.editor"
  members = [
    "serviceAccount:${yandex_iam_service_account.sa.id}"
  ]
}
resource "yandex_resourcemanager_folder_iam_binding" "ydb-editor" {
  folder_id = var.folder_id
  role      = "ydb.editor"
  members = [
    "serviceAccount:${yandex_iam_service_account.sa.id}"
  ]
}

# -------------------------------------
# Создание статических ключей доступа
# https://cloud.yandex.ru/ru/docs/iam/operations/sa/create-access-key
#
# Проверить появление ключа у сервисного аккаунта
# yc iam access-key list --service-account-name=<имя сервисного аккаунта, задается в целевом сервисе>
#
resource "yandex_iam_service_account_static_access_key" "sa-static-key" {
  service_account_id = yandex_iam_service_account.sa.id
  description        = "This key is for my bucket"
}

# Key Management Service
# Добавляем ключ, которым потом будем шифровать бакет
resource "yandex_kms_symmetric_key" "key-a" {
  name              = "key-a"
  description       = "Terraform managed"
  default_algorithm = "AES_256"
}

# Создание бакета
# Object Storage
resource "yandex_storage_bucket" "s3_bucket" {
  access_key = yandex_iam_service_account_static_access_key.sa-static-key.access_key
  secret_key = yandex_iam_service_account_static_access_key.sa-static-key.secret_key
  bucket     = var.s3_bucket_name
  max_size   = 1073741824 # 1Gb

  # # Добавить шифрование бакету
  # # https://cloud.yandex.ru/ru/docs/storage/operations/buckets/encrypt
  # #
  # # при включенном шифровании не записывает в бакет
  # # возможно надо прописывать какую-то до натсройку в целевом модуле при работе с бакетом
  # server_side_encryption_configuration {
  #   rule {
  #     apply_server_side_encryption_by_default {
  #       kms_master_key_id = yandex_kms_symmetric_key.key-a.id
  #       sse_algorithm     = "aws:kms"
  #     }
  #   }
  # }

  # # Редактирование ACL бакета
  # # https://cloud.yandex.ru/ru/docs/storage/operations/buckets/edit-acl
  # #
  # # по какой-то причине из под админа не создается
  # # Error: handling grant: error putting Storage Bucket (ter-05-task-07) ACL: AccessDenied: Access Denied  
  # # >> Пока блок закаменчен, права надо проставить через gui
  # #
  # # так можно через cli создать пермишен на чтение
  # # yc storage bucket update --name ter-05-task-07 \
  # #   --grants grant-type=grant-type-account,grantee-id=<посмотреть в gui id созданной сервисной учетки>,permission=permission-read
  # #
  # # пермишен на запись через cli уже  не создается, показывается ошибка
  # # yc storage bucket update --name ter-05-task-07 \
  # #   --grants grant-type=grant-type-account,grantee-id=<посмотреть в gui id созданной сервисной учетки>,permission=permission-write  
  # #
  # # на самом деле работает и без назначения данных пермишенов пользователю
  # # т.е. в списке пользователей в бакете его нет, а записывать может
  # #
  # grant {
  #   id          = yandex_iam_service_account.sa.id
  #   type        = "CanonicalUser"
  #   permissions = ["READ", "WRITE"]
  # }
}

# -------------------------------------
# Managed Service for YDB
# https://cloud.yandex.ru/ru/docs/ydb/
#
# Создание и изменение параметров бессерверной базы данных
# https://cloud.yandex.ru/ru/docs/ydb/terraform/serverless-database
resource "yandex_ydb_database_serverless" "ydb" {
  name = var.ydb_name

  serverless_database {
    enable_throttling_rcu_limit = true
    provisioned_rcu_limit       = 0
    storage_size_limit          = 10
    throttling_rcu_limit        = 10
  }
}

# # Создание строковых таблиц в базе данных
# # https://cloud.yandex.ru/ru/docs/ydb/terraform/row-tables
# #
# # Пока возможно создание только строковых таблиц, как в данном варианте
# #
# # Информация из документации, по ссылке выше:
# # >> На данный момент поддерживается создание только строковых таблиц.
# # >> Функциональность Terraform провайдера по созданию колоночных таблиц находится в разработке.
# #
# resource "yandex_ydb_table" "ydb_table" {
#   path              = var.ydb_table_name
#   connection_string = yandex_ydb_database_serverless.ydb.ydb_full_endpoint

#   column {
#     name     = "LockID"
#     type     = "String"
#     not_null = true
#   }

#   primary_key = ["LockID"]
# }



# ------------------------------
# записать результат в данный файл в нужном модуле
# secret.backend.tfvars
# ------------------------------
# terraform output access_key
# terraform output secret_key
# terraform output ydb_api


# terraform apply
# - не может назначить роль для пользователя на бакет
# - в YDB не умеет создавать документы


# terraform destroy
# - не может удалить бакет, когда в нем есть данные
