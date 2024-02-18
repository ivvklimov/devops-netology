# для просмотра сформированных output
# terraform output

# output "ydb_cluster_endpoint" {
#   value = yandex_database_cluster.ydb_cluster.endpoint
# }

# output "s3_bucket_name" {
#   value = aws_s3_bucket.tfstate_bucket.bucket
# }

# output "service_account_id" {
#   value = yandex_iam_service_account.service_account.id
# }



# # Статичные ключи на сервисный аккаунт можно посмотреть двумя способами:
# # 1. terraform output sa-static-key
# # 2. terraform console
# #    > yandex_iam_service_account_static_access_key.sa-static-key.access_key
# #    > nonsensitive(yandex_iam_service_account_static_access_key.sa-static-key.secret_key)
# output "sa-static-key" {
#   value = {
#     # id          = yandex_iam_service_account_static_access_key.sa-static-key.id
#     # created_at  = yandex_iam_service_account_static_access_key.sa-static-key.created_at
#     # description = yandex_iam_service_account_static_access_key.sa-static-key.description
#     access_key  = yandex_iam_service_account_static_access_key.sa-static-key.access_key,
#     secret_key  = nonsensitive(yandex_iam_service_account_static_access_key.sa-static-key.secret_key)
#   }
# }

output "access_key" {
  value = yandex_iam_service_account_static_access_key.sa-static-key.access_key
  sensitive = true
}

output "secret_key" {
  value = yandex_iam_service_account_static_access_key.sa-static-key.secret_key
  sensitive = true
}

output "ydb_api" {
  value = yandex_ydb_database_serverless.ydb.document_api_endpoint
  sensitive = true
}

# output "s3_bucket" {
#   value = yandex_storage_bucket.s3_bucket
# }
