resource "yandex_compute_disk" "storage" {
  count       = var.storage_vm["secondary_disk"]["count"]
  name        = "disk-${count.index + 1}"
  type        = "network-hdd"
  size        = var.storage_vm["secondary_disk"]["size"]
  description = "Example disk ${count.index + 1}"
  zone        = var.default_zone
}

data "yandex_compute_image" "storage_image" {
  family = var.storage_vm["image_family"]
}

resource "yandex_compute_instance" "storage" {
  name        = var.storage_vm["vm_name"]
  zone        = var.default_zone
  platform_id = var.storage_vm["platform_id"]

  resources {
    cores         = var.storage_vm["cores"]
    memory        = var.storage_vm["memory"]
    core_fraction = var.storage_vm["core_fraction"]
  }

  boot_disk {
    initialize_params {
      image_id = data.yandex_compute_image.storage_image.image_id
      size     = var.storage_vm["boot_disk"]["size"]
      type     = var.storage_vm["boot_disk"]["type"]
    }
  }

  dynamic "secondary_disk" {
    for_each = yandex_compute_disk.storage

    content {
      disk_id = secondary_disk.value.id
    }
  }

  scheduling_policy {
    preemptible = var.storage_vm.scheduling_policy["preemptible"]
  }

  network_interface {
    subnet_id = yandex_vpc_subnet.develop.id
    # nat       = var.storage_vm.network_interface["nat"]
    nat       = false  # для 6.2
  }

  metadata = local.metadata
}
