output "access_key" {
  value = module.ydb-s3-access.access_key
  sensitive = true
}

output "secret_key" {
  value = module.ydb-s3-access.secret_key
  sensitive = true
}

output "ydb_api" {
  value = module.ydb-s3-access.ydb_api
  sensitive = true
}

# output "s3_bucket" {
#   value = module.ydb-s3-access.s3_bucket
#   sensitive = true
# }