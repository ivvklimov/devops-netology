data "vault_generic_secret" "vault_example"{
  path = "secret/example"
}

resource "vault_generic_secret" "new_secret" {
  path  = "secret/new_secret"
  data_json = <<EOT
    {
      "username": "user",
      "password": "password"
    }
  EOT
}
