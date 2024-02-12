data "terraform_remote_state" "network" {
  backend = "s3"
  config = {
    endpoints = {
      s3 = "https://storage.yandexcloud.net"
    }
    bucket = "netology-ter-35-ivvklimov"
    key    = "dev/network/terraform.state"
    region = "ru-central1"

    skip_region_validation      = true
    skip_credentials_validation = true
    skip_requesting_account_id  = true # необходимая опция при описании бэкенда для Terraform версии старше 1.6.1.

    access_key = var.s3_access_key
    secret_key = var.s3_secret_key
  }
}

module "marketing_vm" {
  source         = "git::https://github.com/udjin10/yandex_compute_instance.git?ref=main"
  env_name       = "develop"
  network_id     = data.terraform_remote_state.network.outputs.network_id
  subnet_zones   = [ data.terraform_remote_state.network.outputs.zone ]
  subnet_ids     = [ data.terraform_remote_state.network.outputs.subnet_id ]
  instance_name  = "marketing-web"
  instance_count = 1
  image_family   = "ubuntu-2004-lts"
  public_ip      = true

  metadata = {
    serial-port-enable = 1
  }

  platform       = "standard-v2"
  boot_disk_size = 10
  preemptible    = true

  labels = {
    "project" = "marketing"
  }
}
