## terraform-tls-simpleRSA

### How to use

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

### Output

```shell
|____main.tf
|____terraform.tfstate
...
|____ca_keys
| |____SinnConsulting_root.key
| |____SinnConsulting_intermediate.key
|____certs
| |____simplersa002.sinn.consulting.fullchain.crt
| |____simplersa001.sinn.consulting.crt
| |____simplersa003.sinn.consulting.key
| |____simplersa003.sinn.consulting.fullchain.crt
| |____SinnConsulting_intermediate.crt
| |____simplersa001.sinn.consulting.key
| |____simplersa002.sinn.consulting.key
| |____simplersa002.sinn.consulting.crt
| |____SinnConsulting_root.crt
| |____simplersa001.sinn.consulting.fullchain.crt
| |____simplersa003.sinn.consulting.crt
```
