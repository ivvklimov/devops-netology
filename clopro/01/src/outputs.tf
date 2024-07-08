output "nat_vm_internal_ip_address" {
  value = module.nat-vm.internal_ip_address
}

output "nat_vm_external_ip_address" {
  value = module.nat-vm.external_ip_address
}

output "public_vm_internal_ip_address" {
  value = module.public-vm.internal_ip_address
}

output "public_vm_external_ip_address" {
  value = module.public-vm.external_ip_address
}

output "private_vm_internal_ip_address" {
  value = module.private-vm.internal_ip_address
}

output "private_vm_external_ip_address" {
  value = module.private-vm.external_ip_address
}
