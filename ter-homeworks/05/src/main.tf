# Определение модуля для создания сети и подсети
module "vpc" {
  source      = "./modules/vpc"
  env_name    = "develop"
  subnet_cidr = "10.0.1.0/24"
  zone        = "ru-central1-a"
}

# # для задания 4*
# module "vpc_prod" {
#   source     = "./modules/vpc2"
#   env_name   = "production"
#   subnets = [
#     { zone = "ru-central1-a", cidr = "10.0.1.0/24" },
#     { zone = "ru-central1-b", cidr = "10.0.2.0/24" },
#     { zone = "ru-central1-c", cidr = "10.0.3.0/24" },
#   ]
# }

# # для задания 4*
# module "vpc_dev" {
#   source     = "./modules/vpc2"
#   env_name   = "develop"
#   subnets = [
#     { zone = "ru-central1-a", cidr = "10.0.1.0/24" },
#   ]
# }

module "marketing_vm" {
  source         = "git::https://github.com/udjin10/yandex_compute_instance.git?ref=main"
  env_name       = "develop"
  network_id     = module.vpc.network_id
  subnet_zones   = [ module.vpc.zone ]
  subnet_ids     = [ module.vpc.subnet_id ]
  instance_name  = "marketing-web"
  instance_count = 1
  image_family   = "ubuntu-2004-lts"
  public_ip      = true

  # # для задания 4*
  # source         = "git::https://github.com/udjin10/yandex_compute_instance.git?ref=main"
  # env_name       = "develop"
  # network_id     = module.vpc_dev.subnets["ru-central1-a"].network_id
  # subnet_zones   = [module.vpc_dev.subnets["ru-central1-a"].zone]
  # subnet_ids     = [module.vpc_dev.subnets["ru-central1-a"].id]
  # instance_name  = "marketing-web"
  # instance_count = 1
  # image_family   = "ubuntu-2004-lts"
  # public_ip      = true

  metadata = {
    user-data          = data.template_file.cloudinit.rendered  # Для демонстрации №3
    serial-port-enable = 1
  }

  platform       = "standard-v2"
  boot_disk_size = 10
  preemptible    = true

  labels = {
    "project" = "marketing"
  }
}

module "analytics_vm" {
  source         = "git::https://github.com/udjin10/yandex_compute_instance.git?ref=main"
  env_name       = "develop"
  network_id     = module.vpc.network_id
  subnet_zones   = [ module.vpc.zone ]
  subnet_ids     = [ module.vpc.subnet_id ]
  instance_name  = "analytics-web"
  instance_count = 1
  image_family   = "ubuntu-2004-lts"
  public_ip      = true

  # # для задания 4*
  # source         = "git::https://github.com/udjin10/yandex_compute_instance.git?ref=main"
  # env_name       = "develop"
  # network_id     = module.vpc_dev.subnets["ru-central1-a"].network_id
  # subnet_zones   = [module.vpc_dev.subnets["ru-central1-a"].zone]
  # subnet_ids     = [module.vpc_dev.subnets["ru-central1-a"].id]
  # instance_name  = "marketing-web"
  # instance_count = 1
  # image_family   = "ubuntu-2004-lts"
  # public_ip      = true

  metadata = {
    user-data          = data.template_file.cloudinit.rendered  # Для демонстрации №3
    serial-port-enable = 1
  }

  platform       = "standard-v2"
  boot_disk_size = 10
  preemptible    = true

  labels = {
    "project" = "analytics"
  }
}
