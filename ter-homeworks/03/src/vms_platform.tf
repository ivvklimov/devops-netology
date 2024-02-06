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

# ---------------------------
# variable "vms_resources" {
#   type = map(object({
#     cores         = number
#     memory        = number
#     core_fraction = number
#   }))
# }

# ---------------------------
variable "each_vm" {
  type = list(object(
    {
      vm_name           = string,
      cores             = number,
      memory            = number,
      boot_disk         = object({ size = number, type = string }),
      core_fraction     = number
      scheduling_policy = object({ preemptible = bool }),
      network_interface = object({ nat = bool }),
      platform_id       = string,
      image_family      = string,
  }))
  default = [
    {
      vm_name           = "main",
      cores             = 4,
      memory            = 2,
      boot_disk         = { size = 15, type = "network-hdd" },
      core_fraction     = 5
      scheduling_policy = { preemptible = true }
      network_interface = { nat = true }
      platform_id       = "standard-v2",
      image_family      = "ubuntu-2004-lts",
    },
    {
      vm_name           = "replica",
      cores             = 2,
      memory            = 1,
      boot_disk         = { size = 10, type = "network-hdd" },
      core_fraction     = 5
      scheduling_policy = { preemptible = true }
      network_interface = { nat = true }
      platform_id       = "standard-v2",
      image_family      = "ubuntu-2004-lts",
    }
  ]
}

variable "count_vm" {
  type = object(
    {
      count             = number,
      vm_name           = string,
      cores             = number,
      memory            = number,
      boot_disk         = object({ size = number, type = string }),
      core_fraction     = number
      scheduling_policy = object({ preemptible = bool }),
      network_interface = object({ nat = bool }),
      platform_id       = string,
      image_family      = string,
  })
  default = {
      count             = 2
      vm_name           = "web",
      cores             = 2,
      memory            = 1,
      boot_disk         = { size = 10, type = "network-hdd" },
      core_fraction     = 5,
      scheduling_policy = { preemptible = true }
      network_interface = { nat = true }
      platform_id       = "standard-v2",
      image_family      = "ubuntu-2004-lts",
    }
}

variable "storage_vm" {
  type = object(
    {
      vm_name           = string,
      cores             = number,
      memory            = number,
      boot_disk         = object({ size = number, type = string }),
      secondary_disk    = object({ size = number, count = number }),
      core_fraction     = number
      scheduling_policy = object({ preemptible = bool }),
      network_interface = object({ nat = bool }),
      platform_id       = string,
      image_family      = string,
  })
  default = {
      vm_name           = "storage",
      cores             = 2,
      memory            = 1,
      boot_disk         = { size = 10, type = "network-hdd" },
      secondary_disk    = { size = 1, count = 3 },
      core_fraction     = 5
      scheduling_policy = { preemptible = true }
      network_interface = { nat = true }
      platform_id       = "standard-v2",
      image_family      = "ubuntu-2004-lts",
    }
}
