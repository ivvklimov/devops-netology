data "yandex_compute_image" "db_images" {
  for_each = { for vm in var.each_vm : vm.vm_name => vm }

  family = each.value.image_family
}

resource "yandex_compute_instance" "databases" {
  for_each = { for vm in var.each_vm : vm.vm_name => vm }

  name        = "db-${each.key}"
  zone        = var.default_zone
  platform_id = each.value.platform_id
  resources {
    cores         = each.value.cores
    memory        = each.value.memory
    core_fraction = each.value.core_fraction
  }

  boot_disk {
    initialize_params {
      image_id = data.yandex_compute_image.db_images[each.key].id
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
