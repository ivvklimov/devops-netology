variable "disk_count" {
  description = "Number of disks to create"
  default     = 3
}

variable "disk_size_gb" {
  description = "Size of each disk in gigabytes"
  default     = 1
}

resource "yandex_compute_disk" "storage" {
  count       = var.disk_count
  name        = "disk-${count.index + 1}"
  type        = "network-hdd"
  size        = var.disk_size_gb
  description = "Example disk ${count.index + 1}"
  zone        = var.default_zone
}

data "yandex_compute_image" "storage_image" {
  family = var.vm_storage_image_family
}

locals {
  storage_vm = {
    vm_name           = "storage",
    cores             = 2,
    memory            = 1,
    boot_disk         = { size = 10, type = "network-hdd" },
    core_fraction     = 5,
    scheduling_policy = { preemptible = true }
    network_interface = { nat = true }
  }
}

resource "yandex_compute_instance" "storage" {
  name        = local.storage_vm["vm_name"]
  zone        = var.default_zone
  platform_id = var.vm_storage_platform_id

  resources {
    cores         = local.storage_vm["cores"]
    memory        = local.storage_vm["memory"]
    core_fraction = local.storage_vm["core_fraction"]
  }

  boot_disk {
    initialize_params {
      image_id = data.yandex_compute_image.storage_image.image_id
      size     = local.storage_vm["boot_disk"]["size"]
      type     = local.storage_vm["boot_disk"]["type"]
    }
  }

  dynamic "secondary_disk" {
    for_each = yandex_compute_disk.storage

    content {
      disk_id = secondary_disk.value.id
    }
  }

  scheduling_policy {
    preemptible = local.storage_vm.scheduling_policy["preemptible"]
  }

  network_interface {
    subnet_id = yandex_vpc_subnet.develop.id
    # nat       = local.storage_vm.network_interface["nat"]
    nat       = false  # для 6.2
  }

  metadata = local.metadata
}
