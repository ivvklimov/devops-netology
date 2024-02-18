# ----------------------------------------
# Задача 4
# ----------------------------------------

variable "ip_cidrhost" {
  type        = string
  description = "ip-адрес"

  default = "192.168.0.1/32"
  # default = "1920.1680.0.1/32"

  validation {
    # При использовании cidrhost необходимо передавать полный CIDR-адрес,
    # например, "192.168.0.1/32", где "/32" указывает на одиночный IP-адрес.
    condition     = can(cidrhost(var.ip_cidrhost, 0))
    error_message = "Must be a valid IP"
  }
}

variable "ip_regex" {
  type        = string
  description = "ip-адрес"

  default = "192.168.0.1"
  # default = "1920.1680.0.1"

  validation {
    condition     = can(regex("^((25[0-5]|(2[0-4]|1\\d|[1-9]|)\\d)\\.?\\b){4}$", var.ip_regex))
    error_message = "Must be a valid IP"
  }
}

variable "ip_list_cidrhost" {
  type        = list(string)
  description = "список ip-адресов"

  default = ["192.168.0.1/32", "1.1.1.1/32", "127.0.0.1/32"]
  # default = ["192.168.0.1/32", "1.1.1.1/32", "1270.0.0.1/32"]

  validation {
    # При использовании cidrhost необходимо передавать полный CIDR-адрес,
    # например, "192.168.0.1/32", где "/32" указывает на одиночный IP-адрес.
    condition     = can([for ip in var.ip_list_cidrhost : cidrhost(ip, 0)])
    error_message = "Must be a valid list of IP addresses"
  }
}

variable "ip_list_regex" {
  type        = list(string)
  description = "список ip-адресов"

  default = ["192.168.0.1", "1.1.1.1", "127.0.0.1"]
  # default = ["192.168.0.1", "1.1.1.1", "1270.0.0.1"]

  validation {
    condition     = can([for ip in var.ip_list_regex : regex("^((25[0-5]|(2[0-4]|1\\d|[1-9]|)\\d)\\.?\\b){4}$", ip)])
    error_message = "Must be a valid list of IP addresses"
  }
}

# ----------------------------------------
# Задача 5*
# ----------------------------------------

variable "any_string" {
  description = "любая строка"
  type        = string

  default = "example !#%0153/+= string"
  # default = "example !#%0153/+= String"

  validation {
    condition     = can(regex("^[^A-Z]*$", var.any_string))
    error_message = "String must not contain uppercase letters"
  }
}

variable "in_the_end_there_can_be_only_one" {
  description = "Who is better Connor or Duncan?"
  type = object({
    Dunkan = optional(bool)
    Connor = optional(bool)
  })

  default = {
    Dunkan = true
    Connor = false
  }

  validation {
    error_message = "There can be only one MacLeod"
    # проверяем, что в словаре должно один раз всречаться значение true
    condition = length([for k, v in var.in_the_end_there_can_be_only_one : v if v == true]) == 1
  }
}

# Дополнительная валидация
# Проверяет, что все элементы имеют одинаковые значения
variable "both_the_same" {
  description = "Same values"
  type = object({
    Dunkan = optional(bool)
    Connor = optional(bool)
  })

  default = {
    Dunkan = true
    Connor = true
  }

  validation {
    error_message = "Both values must be the same"
    # проверяем, что в словаре отсутствуют элементы со значением true (значит все false) или
    # отсутствуют элементы со значением false (значит все true)
    condition = length([for k, v in var.both_the_same : v if v == true]) == 0 || length([
      for k, v in var.both_the_same : v if v == false]) == 0
  }
}
