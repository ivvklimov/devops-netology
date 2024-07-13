variable "cloud_id" {
  type        = string
  description = "https://cloud.yandex.ru/docs/resource-manager/operations/cloud/get-id"
}

variable "folder_id" {
  type        = string
  description = "https://cloud.yandex.ru/docs/resource-manager/operations/folder/get-id"
}

variable "service_account_key_file" {
  type        = string
  description = "Path to key json file"
}

variable "default_zone" {
  type        = string
  default     = "ru-central1-a"
  description = "https://cloud.yandex.ru/docs/overview/concepts/geo-scope"
}

variable "ssh_public_key" {
  type        = string
  description = "Location of SSH public key."
}

# variable "vpc_network_name" {
#   type        = string
#   description = "vpc network name"
# }

# variable "private_subnet" {
#   type = object(
#     {
#       name = string,
#       cidr = string,
#   })
# }

# variable "lamp-instance-image-id" {
#   type        = string
#   description = "Lamp instance image id"
# }
