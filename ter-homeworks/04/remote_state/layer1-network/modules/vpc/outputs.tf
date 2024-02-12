output "network_name" {
  value = yandex_vpc_network.network.name
}

output "network_id" {
  value = yandex_vpc_network.network.id
}

output "subnet_id" {
  value = yandex_vpc_subnet.subnet.id
}

output "zone" {
  value = yandex_vpc_subnet.subnet.zone
}

output "cidr" {
  value = yandex_vpc_subnet.subnet.v4_cidr_blocks
}
