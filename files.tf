resource "local_file" "root_ca_cert" {
  content         = tls_self_signed_cert.root_ca.cert_pem
  filename        = "./certs/${var.organization}_root.crt"
  file_permission = "0600"
}

resource "local_file" "root_ca_key" {
  content         = tls_private_key.root_ca.private_key_pem
  filename        = "./ca_keys/${var.organization}_root.key"
  file_permission = "0600"
}

resource "local_file" "intermediate_ca_cert" {
  content         = tls_locally_signed_cert.intermediate_ca.cert_pem
  filename        = "./certs/${var.organization}_intermediate.crt"
  file_permission = "0600"
}

resource "local_file" "intermediate_ca_key" {
  content         = tls_private_key.intermediate_ca.private_key_pem
  filename        = "./ca_keys/${var.organization}_intermediate.key"
  file_permission = "0600"
}

resource "local_file" "server_key" {
  count           = length(var.dns_names)
  content         = element(tls_private_key.server.*.private_key_pem, count.index)
  filename        = "./certs/${var.dns_names[count.index]}.key"
  file_permission = "0600"
}
