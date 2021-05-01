## terraform-tls-simpleRSA

How to use

```hcl
module "ca" {
  source = "./_ca"

  dns_names = [
    "simplersa001.sinn.consulting",
    "simplersa002.sinn.consulting",
    "simplersa003.sinn.consulting",
  ]

  client_cert  = true
  organization = "SinnConsulting"
  algorithm    = "RSA"
  rsa_bits     = "4096"
}
```
