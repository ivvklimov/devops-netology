module "ydb-s3-access" {
  source         = "../modules/ydb-s3-tfstate"
  folder_id      = var.folder_id
  sa_name        = "ter-05-task-07"
  s3_bucket_name = "ter-05-task-07"
  ydb_name       = "ter-05-task-07"
  ydb_table_name = "tfstate-dev"
}
