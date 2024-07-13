// Create Service Account
resource "yandex_iam_service_account" "sa-bucket" {
  name = "sa-for-bucket"
}

// Grant permissions for storage
resource "yandex_resourcemanager_folder_iam_member" "bucket-editor" {
  folder_id = var.folder_id
  role      = "storage.editor"
  member    = "serviceAccount:${yandex_iam_service_account.sa-bucket.id}"
}

// Create Static Access Keys
resource "yandex_iam_service_account_static_access_key" "sa-static-key" {
  service_account_id = yandex_iam_service_account.sa-bucket.id
  description        = "static access key for bucket"
}

// Create KMS Key
resource "yandex_kms_symmetric_key" "key-a" {
  name              = "encryption-key"
  description       = "Key for encrypting bucket objects"
  default_algorithm = "AES_256"
  rotation_period   = "168h"
}

// Use keys to create bucket with encryption
resource "yandex_storage_bucket" "netology-bucket" {
  access_key = yandex_iam_service_account_static_access_key.sa-static-key.access_key
  secret_key = yandex_iam_service_account_static_access_key.sa-static-key.secret_key
  bucket     = "ivvklimov-netology-bucket-2"
  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        kms_master_key_id = yandex_kms_symmetric_key.key-a.id
        sse_algorithm     = "aws:kms"
      }
    }
  }
}

// Add picture to bucket
resource "yandex_storage_object" "object-1" {
  access_key = yandex_iam_service_account_static_access_key.sa-static-key.access_key
  secret_key = yandex_iam_service_account_static_access_key.sa-static-key.secret_key
  bucket     = yandex_storage_bucket.netology-bucket.bucket
  key        = "nature.png"
  source     = "png/nature.png"
  acl        = "public-read"
}
