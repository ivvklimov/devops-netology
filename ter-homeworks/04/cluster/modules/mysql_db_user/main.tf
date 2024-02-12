terraform {
  required_providers {
    yandex = {
      source = "yandex-cloud/yandex"
    }
  }
  required_version = ">= 0.13"
}

# Определение ресурса для создания базы данных
resource "yandex_mdb_mysql_database" "database" {
  cluster_id = var.cluster_id
  name       = var.db
}

# Определение ресурса для создания пользователя с привязкой к базе данных
resource "yandex_mdb_mysql_user" "mysql_user" {
  cluster_id = var.cluster_id
  name       = var.username
  password   = var.password
  permission {
    database_name = yandex_mdb_mysql_database.database.name
    roles         = var.db_user_roles
  }
}
