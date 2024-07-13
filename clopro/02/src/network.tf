resource "yandex_vpc_network" "network" {
  name = var.vpc_network_name
}

resource "yandex_vpc_subnet" "private-subnet" {
  name           = var.private_subnet.name
  network_id     = yandex_vpc_network.network.id
  zone           = var.default_zone
  v4_cidr_blocks = [var.private_subnet.cidr]
}
