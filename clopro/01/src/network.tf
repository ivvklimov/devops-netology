resource "yandex_vpc_network" "network" {
  name = var.vpc_network_name
}

resource "yandex_vpc_subnet" "public-subnet" {
  name           = var.public_subnet.name
  network_id     = yandex_vpc_network.network.id
  zone           = var.default_zone
  v4_cidr_blocks = [var.public_subnet.cidr]
}

resource "yandex_vpc_subnet" "private-subnet" {
  name           = var.private_subnet.name
  network_id     = yandex_vpc_network.network.id
  zone           = var.default_zone
  v4_cidr_blocks = [var.private_subnet.cidr]
  route_table_id = yandex_vpc_route_table.nat-route-table.id
}

resource "yandex_vpc_route_table" "nat-route-table" {
  network_id = yandex_vpc_network.network.id

  static_route {
    destination_prefix = var.nat_route_table.static_route.destination_prefix
    next_hop_address   = var.nat_route_table.static_route.next_hop_address
  }
}
