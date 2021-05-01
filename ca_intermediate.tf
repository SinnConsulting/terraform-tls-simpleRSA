// intermediate cert is signed by root ca
resource "tls_private_key" "intermediate_ca" {
  algorithm = var.algorithm
  rsa_bits  = var.rsa_bits
}

resource "tls_cert_request" "intermediate_ca" {
  key_algorithm   = tls_private_key.intermediate_ca.algorithm
  private_key_pem = tls_private_key.intermediate_ca.private_key_pem

  subject {
    common_name  = "${var.organization}-Intermediate"
    organization = var.organization
  }
}

resource "tls_locally_signed_cert" "intermediate_ca" {
  cert_request_pem = tls_cert_request.intermediate_ca.cert_request_pem

  ca_key_algorithm   = tls_private_key.root_ca.algorithm
  ca_private_key_pem = tls_private_key.root_ca.private_key_pem
  ca_cert_pem        = tls_self_signed_cert.root_ca.cert_pem

  is_ca_certificate     = true
  validity_period_hours = var.validity_period_hours_intermediate

  allowed_uses = [
    "key_encipherment",
    "digital_signature",
    "cert_signing",
  ]
}
