terraform {
  required_providers {
    virtualbox = {
      source = "shekeriev/virtualbox"
      version = "0.0.4"
    }
  }
}

provider "virtualbox" {
  delay      = 60
  mintimeout = 5
}

# предварительно скачиваем образ
# wget https://app.vagrantup.com/shekeriev/boxes/debian-11/versions/0.2/providers/virtualbox.box ~/virtualbox_images/debian-11

resource "virtualbox_vm" "vm1" {
  name   = "debian_11"
  image  = "~/virtualbox_images/debian-11/virtualbox.box"
  cpus   = 1
  memory = "512 mib"

  network_adapter {
    type           = "bridged"
    device         = "IntelPro1000MTDesktop"
    host_interface = "enp0s3"
  }
}

output "IPAddress" {
  value = element(virtualbox_vm.vm1.*.network_adapter.0.ipv4_address, 1)
}
