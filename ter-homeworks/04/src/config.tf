data template_file "cloudinit" {
  template = file("${path.module}/templates/cloud-init.yml")

  vars = {
    ssh_public_key = file(var.ssh_public_key)
  }
}