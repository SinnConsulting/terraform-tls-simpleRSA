resource "null_resource" "check_certs" {
  count = length(local_file.server_cert.*.filename)
  provisioner "local-exec" {
    command = "openssl verify -CAfile ${local_file.root_ca_cert.filename} -untrusted ${local_file.intermediate_ca_cert.filename} ${element(local_file.server_cert.*.filename, count.index)}"
  }
}
