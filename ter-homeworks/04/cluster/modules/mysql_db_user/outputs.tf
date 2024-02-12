output "database_id" {
  value       = yandex_mdb_mysql_database.database.id
  description = "ID созданной базы данных"
}

output "user_id" {
  value       = yandex_mdb_mysql_user.mysql_user.id
  description = "ID созданного пользователя"
}
