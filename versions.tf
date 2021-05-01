terraform {
  required_providers {
    tls = {
      source  = "hashicorp/tls"
      version = "~>3.1.0"
    }
    local = {
      source  = "hashicorp/local"
      version = "~> 2.1.0"
    }
  }
  required_version = ">= 0.13"
}
