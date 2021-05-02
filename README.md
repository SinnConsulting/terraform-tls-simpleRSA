## terraform-tls-simpleRSA

### How to use

#### hashicorp registry
```hcl
module "simpleRSA" {
  source  = "SinnConsulting/simpleRSA/tls"
  # version = "<version>"

  # insert the 2 required variables here
  dns_names = [
    "simplersa001.sinn.consulting",
    "simplersa002.sinn.consulting",
    "simplersa003.sinn.consulting",
  ]

  organization = "SinnConsulting"
}
```
#### local
```hcl
module "simpleRSA" {
  source = "./terraform-tls-simpleRSA"

  # insert the 2 required variables here
  dns_names = [
    "simplersa001.sinn.consulting",
    "simplersa002.sinn.consulting",
    "simplersa003.sinn.consulting",
  ]

  organization = "SinnConsulting"
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
