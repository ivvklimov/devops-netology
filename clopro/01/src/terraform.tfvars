vpc_network_name = "netology-clopro-01"

public_subnet = {
  name = "public_subnet",
  cidr = "192.168.10.0/24"
}

private_subnet = {
  name = "private_subnet",
  cidr = "192.168.20.0/24"
}

nat_route_table = {
  static_route = {
    destination_prefix = "0.0.0.0/0",
    next_hop_address   = "192.168.10.254"
  }
}
