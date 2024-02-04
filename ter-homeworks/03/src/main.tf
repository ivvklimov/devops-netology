resource "yandex_vpc_network" "develop" {
  name = var.vpc_name
}
resource "yandex_vpc_subnet" "develop" {
  name           = var.vpc_name
  zone           = var.default_zone
  network_id     = yandex_vpc_network.develop.id
  v4_cidr_blocks = var.default_cidr
}

output "vm_info" {
  value = concat([
    for vm in yandex_compute_instance.webservers : {
      name = vm.name
      id   = vm.id
      fqdn = vm.fqdn
    }
  ], [
    for vm in yandex_compute_instance.databases : {
      name = vm.name
      id   = vm.id
      fqdn = vm.fqdn
    }
  ], [
    for vm in [yandex_compute_instance.storage] : {
      name = vm.name
      id   = vm.id
      fqdn = vm.fqdn
    }
  ])
}
