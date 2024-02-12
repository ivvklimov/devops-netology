# Определение модуля для создания сети и подсети
module "vpc_dev" {
  source     = "./modules/vpc2"
  env_name   = "develop"
  subnets = [
    { zone = "ru-central1-a", cidr = "10.0.1.0/24" },
  ]
}

module "mysql_cluster" {
  source       = "./modules/mysql_cluster"
  cluster_name = "mysql_cluster"
  network_id   = module.vpc_dev.subnets["ru-central1-a"].network_id
  zone         = module.vpc_dev.subnets["ru-central1-a"].zone
  subnet_id    = module.vpc_dev.subnets["ru-central1-a"].id
  ha           = false
}

module "mysql_db_user" {
  source     = "./modules/mysql_db_user"
  db         = "test"
  username   = "app"
  password   = "0123456789"
  cluster_id = module.mysql_cluster.cluster_id
}
