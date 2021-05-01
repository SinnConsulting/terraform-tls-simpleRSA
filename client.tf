resource "tls_private_key" "server" {
  count     = length(var.dns_names)
  algorithm = var.algorithm
  rsa_bits  = var.rsa_bits
}

resource "random_id" "server" {
  keepers = {
    name = var.organization
  }
  byte_length = 8
}

resource "tls_cert_request" "server" {
  count           = length(var.dns_names)
  key_algorithm   = element(tls_private_key.server.*.algorithm, count.index)
  private_key_pem = element(tls_private_key.server.*.private_key_pem, count.index)

  subject {
    common_name   = var.dns_names[count.index]
    organization  = var.organization
    serial_number = random_id.server.hex
  }

  dns_names = [var.dns_names[count.index]]
}

resource "tls_locally_signed_cert" "server" {
  count            = length(var.dns_names)
  cert_request_pem = element(tls_cert_request.server.*.cert_request_pem, count.index)

  ca_key_algorithm   = tls_private_key.intermediate_ca.algorithm
  ca_private_key_pem = tls_private_key.intermediate_ca.private_key_pem
  ca_cert_pem        = tls_locally_signed_cert.intermediate_ca.cert_pem

  validity_period_hours = 8760

  allowed_uses = [
    "key_encipherment",
    "server_auth",
  ]
}

resource "local_file" "server_cert" {
  count    = length(var.dns_names)
  content  = element(tls_locally_signed_cert.server.*.cert_pem, count.index)
  filename = "./certs/${var.dns_names[count.index]}.crt"
}

resource "local_file" "server_full_chain" {
  count    = length(var.dns_names)
  content  = "element(tls_locally_signed_cert.server.*.cert_pem, count.index)}${tls_locally_signed_cert.intermediate_ca.cert_pem}"
  filename = "./certs/${var.dns_names[count.index]}.fullchain.crt"
}
