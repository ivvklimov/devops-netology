variable "network_id" {
  description = "The ID of the network where the MySQL cluster will be deployed"
  type        = string
}

variable "number_of_hosts" {
  description = "Number of hosts in the MySQL cluster"
  type        = number
  default     = 2
}

variable "zone" {
  type = string
}

variable "subnet_id" {
  type = string
}

variable "cluster_name" {
  type    = string
  default = "my-cluster"
}

variable "env_name" {
  type    = string
  default = "PRESTABLE"
}

variable "ha" {
  type    = bool
  default = true
}

variable "cluster_resources" {
  type = object({
    resource_preset_id = string
    disk_type_id       = string
    disk_size          = number
  })

  default = {
    resource_preset_id = "b2.medium"
    disk_type_id       = "network-hdd"
    disk_size          = 10
  }
}

variable "cluster_version" {
  type    = string
  default = "8.0"
}

variable "deletion_protection" {
  type    = bool
  default = false
}
