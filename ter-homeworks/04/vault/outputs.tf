output "vault_example" {
  value = "${nonsensitive(data.vault_generic_secret.vault_example.data)}"
} 

output "new_secret_username" {
  value = nonsensitive(vault_generic_secret.new_secret.data["username"])
}

output "new_secret_password" {
  value = nonsensitive(vault_generic_secret.new_secret.data["password"])
}
