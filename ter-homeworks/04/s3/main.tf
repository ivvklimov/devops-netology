# To always have a unique bucket name in this example
resource "random_string" "unique_id" {
  length  = 8
  upper   = false
  lower   = true
  numeric = true
  special = false
}

module "s3" {
  source      = "git::https://github.com/terraform-yc-modules/terraform-yc-s3.git"
  # source      = "git::https://github.com/terraform-yc-modules/terraform-yc-s3.git?ref=0ed1dddf81adc20055891e9f94233f0c6c8aec7c"  
  bucket_name = "simple-bucket-${random_string.unique_id.result}"
}
