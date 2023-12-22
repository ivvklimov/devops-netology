output "instance_ip_map" {
  value = {
    for instance in [yandex_compute_instance.web_platform, yandex_compute_instance.db_platform] :
        instance.name => instance.network_interface[0].nat_ip_address
  }
  description = "Instance name to external ip mapping list"
}
