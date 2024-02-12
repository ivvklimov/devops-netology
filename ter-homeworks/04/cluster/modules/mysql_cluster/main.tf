terraform {
  required_providers {
    yandex = {
      source = "yandex-cloud/yandex"
    }
  }
  required_version = ">= 0.13"
}

resource "yandex_mdb_mysql_cluster" "mysql_cluster" {
  name                = var.cluster_name
  environment         = var.env_name
  network_id          = var.network_id
  version             = var.cluster_version
  deletion_protection = var.deletion_protection

  resources {
    resource_preset_id = var.cluster_resources["resource_preset_id"]
    disk_type_id       = var.cluster_resources["disk_type_id"]
    disk_size          = var.cluster_resources["disk_size"]
  }

  dynamic "host" {
    for_each = var.ha ? range(var.number_of_hosts) : [0]
    content {
      zone      = var.zone
      subnet_id = var.subnet_id
    }
  }
}
