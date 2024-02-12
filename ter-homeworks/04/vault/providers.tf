provider "vault" {
  address = "http://192.168.0.35:8200/"
  skip_tls_verify = true
  token = "education"
}
