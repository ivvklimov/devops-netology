module "vpc" {
  source      = "./modules/vpc"
  env_name    = "develop"
  subnet_cidr = "10.0.1.0/24"
  zone        = "ru-central1-a"
}
