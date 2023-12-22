# variable "vm_web_name" {
#   type        = string
#   default     = "netology-develop-platform-web"
#   description = "vm name"
# }

variable "vm_web_platform_id" {
  type        = string
  default     = "standard-v2"
  description = "vm platform_id"
}

variable "vm_web_image_family" {
  type        = string
  default     = "ubuntu-2004-lts"
  description = "vm image family"
}

# variable "vm_db_name" {
#   type        = string
#   default     = "netology-develop-platform-db"
#   description = "vm name"
# }

variable "vm_db_platform_id" {
  type        = string
  default     = "standard-v2"
  description = "vm platform_id"
}

variable "vm_db_image_family" {
  type        = string
  default     = "ubuntu-2004-lts"
  description = "vm image family"
}

variable "vm_data" {
  type = map(object({
    company  = string
    env_type = string
    platform = string
    service  = string
  }))

  default = {
    common = {
      company  = "netology"
      env_type = "develop"
      platform = "platform"
      service  = ""
    }
  }
}
