locals {
  metadata = {
    serial-port-enable = "1"
    ssh-keys           = "ubuntu:${var.vms_ssh_root_key}"
  }

  vm_data = {
    web = merge(var.vm_data["common"], {
      service = "web"
    }),
    db = merge(var.vm_data["common"], {
      service = "db"
    }),
  }

  # по моему мнению в данном формате более читабельно, нежели через интерполяцию
  # через интерполяцию будет вот так: "${param1}-${param2}-${param3}"
  vm_web_name = format("%s-%s-%s-%s",
    local.vm_data["web"].company,
    local.vm_data["web"].env_type,
    local.vm_data["web"].platform,
    local.vm_data["web"].service
  )

  vm_db_name = format("%s-%s-%s-%s",
    local.vm_data["db"].company,
    local.vm_data["db"].env_type,
    local.vm_data["db"].platform,
    local.vm_data["db"].service
  )
}
