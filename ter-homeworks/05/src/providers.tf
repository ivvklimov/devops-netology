terraform {
  required_providers {
    yandex = {
      source = "yandex-cloud/yandex"
      version = ">=0.90.0"
    }
    
    template = {
      source  = "hashicorp/template"
      version = "2.2.0"
    }  
  }

  backend "s3" {
    endpoints = {
      s3 = "https://storage.yandexcloud.net"
    }
    bucket = "netology-ter-35-ivvklimov"
    key    = "ter-05/dev/terraform.state"
    region = "ru-central1"

    skip_region_validation      = true
    skip_credentials_validation = true
    skip_requesting_account_id  = true # необходимая опция Terraform для версии 1.6.1 и старше.
    skip_s3_checksum            = true # необходимая опция при описании бэкенда для Terraform версии 1.6.3 и старше.

    # блокировка стейта
    dynamodb_endpoint = "https://docapi.serverless.yandexcloud.net/ru-central1/b1grv7uc1mlrq2p2a6n5/etn73u2jrj4kksj7lrbn"
    dynamodb_table    = "tfstate-dev"
  }

  required_version = ">=1.5"
}

provider "yandex" {
  service_account_key_file = var.service_account_key_file
  cloud_id                 = var.cloud_id
  folder_id                = var.folder_id
  zone                     = var.default_zone
}
