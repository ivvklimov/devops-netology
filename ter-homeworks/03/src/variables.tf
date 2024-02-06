# ###cloud vars
# variable "token" {
#   type        = string
#   description = "OAuth-token; https://cloud.yandex.ru/docs/iam/concepts/authorization/oauth-token"
# }

variable "cloud_id" {
  type        = string
  description = "https://cloud.yandex.ru/docs/resource-manager/operations/cloud/get-id"
}

variable "folder_id" {
  type        = string
  description = "https://cloud.yandex.ru/docs/resource-manager/operations/folder/get-id"
}

variable "default_zone" {
  type        = string
  default     = "ru-central1-a"
  description = "https://cloud.yandex.ru/docs/overview/concepts/geo-scope"
}

variable "default_cidr" {
  type        = list(string)
  default     = ["10.0.1.0/24"]
  description = "https://cloud.yandex.ru/docs/vpc/operations/subnet-create"
}

variable "vpc_name" {
  type        = string
  default     = "develop"
  description = "VPC network&subnet name"
}

variable "service_account_key_file" {
  type        = string
  description = "Path to key json file"
}

variable "vms_ssh_root_key" {
  type        = string
  default     = "<your_ssh_ed25519_key>"
  description = "ssh-keygen -t ed25519"
}

variable "public_key" {
  type    = string
  default = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDYqg0OxWS3TFgDB1gOSh3DuMu/KncEx1R+Gqmf9pBty6Hr+EEWA789jHao1e6ackJdxmNvllPYTm1pWtS2iLr7d8ki79WOUJ24YKdVc/kKF9YYnhSKJlaM7F5cKHMskyRAwi8IAFRqTdrgRoAC0xv6dORXJWIdkQ7HURque/BYK+ZMiFVTQaFFOTY/dIV/QEIIBNKvs5ESDMwK01XTwqtTg2xyS3uYV2zlLmz5ULtQatz8u79vnYYK/NmwfAy1l4B3sG7kZVeoSYDBgi0qqVeS6/nLYKMxCxLU/yUx1wzPkrEqPepOMv8CUzfiqxuCkHo9gluIceuosEmBqDpu39AH kiv@netology"
}
