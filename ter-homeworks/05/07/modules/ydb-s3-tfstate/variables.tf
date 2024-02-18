variable "folder_id" {
  type        = string
  description = "https://cloud.yandex.ru/docs/resource-manager/operations/folder/get-id"
}

variable "sa_name" {
  description = "Service account name"
  type        = string
}

variable "s3_bucket_name" {
  description = "S3 bucket name"
  type        = string
}

variable "ydb_name" {
  description = "YDB name"
  type        = string
}

variable "ydb_table_name" {
  description = "YDB table name"
  type        = string
}
