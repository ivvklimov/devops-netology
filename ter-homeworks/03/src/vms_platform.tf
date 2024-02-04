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

variable "vm_storage_platform_id" {
  type        = string
  default     = "standard-v2"
  description = "vm platform_id"
}

variable "vm_storage_image_family" {
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

variable "web_provision" {
  type    = bool
  default = true
  description="ansible provision switch variable"
}
