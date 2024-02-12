terraform {
  required_providers {
    yandex = {
      source = "yandex-cloud/yandex"
    }
  }
  required_version = ">= 0.13"
}

resource "yandex_vpc_network" "network" {
  name = var.env_name
}

resource "yandex_vpc_subnet" "subnets" {
  for_each = { for s in var.subnets : s.zone => s }

  name           = "${var.env_name}-${each.value.zone}-subnet"
  network_id     = yandex_vpc_network.network.id
  zone           = each.value.zone
  v4_cidr_blocks = [each.value.cidr]
}
