output "network_name" {
  value = module.vpc.network_name
}

output "network_id" {
  value = module.vpc.network_id
}

output "subnet_id" {
  value = module.vpc.subnet_id
}

output "zone" {
  value = module.vpc.zone
}

output "cidr" {
  value = module.vpc.cidr
}
