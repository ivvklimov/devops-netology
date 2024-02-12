###cloud vars
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

# variable "ssh_public_key" {
#   type        = string
#   default     = "~/.ssh/id_rsa.pub"
# }

variable ssh_public_key {
  type        = string
  description = "Location of SSH public key."
}


# variable "public_key" {
#   type    = string
#   default = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIIOERolx3KtJ5+3FufMC88MhcYISKmL28lYydyc4MGYV udjin@udjin-VirtualBox"
# }

variable "allow_stopping_for_update" {
  type = bool
  default = true
}

variable "s3_access_key" {
  type = string
}

variable "s3_secret_key" {
  type = string
}
