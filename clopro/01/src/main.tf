module "nat-vm" {
  source            = "git::https://github.com/udjin10/yandex_compute_instance.git?ref=main"
  env_name          = "dev"
  network_id        = yandex_vpc_network.network.id
  subnet_zones      = [var.default_zone]
  subnet_ids        = [yandex_vpc_subnet.public-subnet.id]
  instance_name     = "nat"
  instance_count    = 1
  image_family      = "nat-instance-ubuntu"
  public_ip         = true
  known_internal_ip = "192.168.10.254"

  metadata = {
    user-data          = data.template_file.cloudinit.rendered
    serial-port-enable = 1
  }

  platform       = "standard-v2"
  boot_disk_size = 10
  preemptible    = true

  labels = {
    "project" = "clopro-01",
    "managed" = "terraform"
  }
}

module "public-vm" {
  source            = "git::https://github.com/udjin10/yandex_compute_instance.git?ref=main"
  env_name          = "dev"
  network_id        = yandex_vpc_network.network.id
  subnet_zones      = [var.default_zone]
  subnet_ids        = [yandex_vpc_subnet.public-subnet.id]
  instance_name     = "public-vm"
  instance_count    = 1
  image_family      = "ubuntu-2004-lts"
  public_ip         = true
  known_internal_ip = "192.168.10.10"

  metadata = {
    user-data          = data.template_file.cloudinit.rendered
    serial-port-enable = 1
  }

  platform       = "standard-v2"
  boot_disk_size = 10
  preemptible    = true

  labels = {
    "project" = "clopro-01",
    "managed" = "terraform"
  }
}

module "private-vm" {
  source            = "git::https://github.com/udjin10/yandex_compute_instance.git?ref=main"
  env_name          = "dev"
  network_id        = yandex_vpc_network.network.id
  subnet_zones      = [var.default_zone]
  subnet_ids        = [yandex_vpc_subnet.private-subnet.id]
  instance_name     = "private-vm"
  instance_count    = 1
  image_family      = "ubuntu-2004-lts"
  public_ip         = false
  known_internal_ip = "192.168.20.20"

  metadata = {
    user-data          = data.template_file.cloudinit.rendered
    serial-port-enable = 1
  }

  platform       = "standard-v2"
  boot_disk_size = 10
  preemptible    = true

  labels = {
    "project" = "clopro-01",
    "managed" = "terraform"
  }
}
