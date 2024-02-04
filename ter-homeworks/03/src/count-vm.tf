data "yandex_compute_image" "web_image" {
  family = var.vm_web_image_family
}

locals {
  count_vm = {
    count             = 2
    vm_name           = "web",
    cores             = 2,
    memory            = 1,
    boot_disk         = { size = 10, type = "network-hdd" },
    core_fraction     = 5,
    scheduling_policy = { preemptible = true }
    network_interface = { nat = true }
  }
}

resource "yandex_compute_instance" "webservers" {
  count       = local.count_vm["count"]
  name        = "${local.count_vm["vm_name"]}-${count.index + 1}"
  zone        = var.default_zone
  platform_id = var.vm_web_platform_id
  depends_on  = [yandex_compute_instance.databases]

  resources {
    cores         = local.count_vm["cores"]
    memory        = local.count_vm["memory"]
    core_fraction = local.count_vm["core_fraction"]
  }

  boot_disk {
    initialize_params {
      image_id = data.yandex_compute_image.web_image.image_id
      size     = local.count_vm["boot_disk"]["size"]
      type     = local.count_vm["boot_disk"]["type"]
    }
  }

  scheduling_policy {
    preemptible = local.count_vm.scheduling_policy["preemptible"]
  }

  network_interface {
    subnet_id          = yandex_vpc_subnet.develop.id
    nat                = local.count_vm.network_interface["nat"]
    security_group_ids = [yandex_vpc_security_group.example.id]
  }

  metadata = local.metadata
}
