data "yandex_compute_image" "web_image" {
  family = var.count_vm["image_family"]
}

resource "yandex_compute_instance" "webservers" {
  count       = var.count_vm["count"]
  name        = "${var.count_vm["vm_name"]}-${count.index + 1}"
  zone        = var.default_zone
  platform_id = var.count_vm["platform_id"]
  depends_on  = [yandex_compute_instance.databases]

  resources {
    cores         = var.count_vm["cores"]
    memory        = var.count_vm["memory"]
    core_fraction = var.count_vm["core_fraction"]
  }

  boot_disk {
    initialize_params {
      image_id = data.yandex_compute_image.web_image.image_id
      size     = var.count_vm["boot_disk"]["size"]
      type     = var.count_vm["boot_disk"]["type"]
    }
  }

  scheduling_policy {
    preemptible = var.count_vm.scheduling_policy["preemptible"]
  }

  network_interface {
    subnet_id          = yandex_vpc_subnet.develop.id
    nat                = var.count_vm.network_interface["nat"]
    security_group_ids = [yandex_vpc_security_group.example.id]
  }

  metadata = local.metadata
}
