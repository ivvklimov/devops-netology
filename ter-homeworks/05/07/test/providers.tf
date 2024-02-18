terraform {
  required_providers {
    yandex = {
      source = "yandex-cloud/yandex"
    }
  }

  # инициализировать надо вот так:
  # terraform init -reconfigure -backend-config=secret.backend.tfvars
  backend "s3" {
    endpoints = {
      s3 = "https://storage.yandexcloud.net"
    }
    bucket = "ter-05-task-07"
    key    = "dev/terraform.state"
    region = "ru-central1"

    skip_region_validation      = true
    skip_credentials_validation = true
    skip_requesting_account_id  = true # необходимая опция Terraform для версии 1.6.1 и старше.
    skip_s3_checksum            = true # необходимая опция при описании бэкенда для Terraform версии 1.6.3 и старше.

    # блокировка стейта прописана в секретах
  }

  required_version = ">=1.5"
}

provider "yandex" {
  service_account_key_file = var.service_account_key_file
  cloud_id                 = var.cloud_id
  folder_id                = var.folder_id
  zone                     = var.default_zone
}
