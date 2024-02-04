data "yandex_compute_image" "db_image" {
  family = var.vm_db_image_family
}

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
    },
    {
      vm_name           = "replica",
      cores             = 2,
      memory            = 1,
      boot_disk         = { size = 10, type = "network-hdd" },
      core_fraction     = 5
      scheduling_policy = { preemptible = true }
      network_interface = { nat = true }
    },
  ]
}

resource "yandex_compute_instance" "databases" {
  for_each = { for vm in var.each_vm : vm.vm_name => vm }

  name        = "db-${each.key}"
  zone        = var.default_zone
  platform_id = var.vm_db_platform_id

  resources {
    cores         = each.value.cores
    memory        = each.value.memory
    core_fraction = each.value.core_fraction
  }

  boot_disk {
    initialize_params {
      image_id = data.yandex_compute_image.db_image.image_id
      size     = each.value.boot_disk["size"]
      type     = each.value.boot_disk["type"]
    }
  }

  scheduling_policy {
    preemptible = each.value.scheduling_policy["preemptible"]
  }

  network_interface {
    subnet_id = yandex_vpc_subnet.develop.id
    nat       = each.value.network_interface["nat"]
  }

  metadata = local.metadata
}
