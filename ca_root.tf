resource "tls_private_key" "root_ca" {
  algorithm = var.algorithm
  rsa_bits  = var.rsa_bits
}

resource "tls_self_signed_cert" "root_ca" {
  key_algorithm   = tls_private_key.root_ca.algorithm
  private_key_pem = tls_private_key.root_ca.private_key_pem

  subject {
    common_name  = "${var.organization}-Root"
    organization = var.organization
  }

  is_ca_certificate     = true
  validity_period_hours = var.validity_period_hours_root

  allowed_uses = [
    "key_encipherment",
    "digital_signature",
    "cert_signing",
  ]
}
