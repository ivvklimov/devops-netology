variable "db" {
  type        = string
  description = "Имя базы данных"
}

variable "username" {
  type        = string
  description = "Имя пользователя"
}

variable "password" {
  type        = string
  description = "Пароль пользователя"
}

variable "cluster_id" {
  type        = string
  description = "ID кластера managed MySQL"
}

variable "db_user_roles" {
  type    = list(string)
  default = ["ALL"]
}
