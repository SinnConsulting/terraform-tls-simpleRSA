variable "dns_names" {
  description = ""
  type        = list(string)
}

variable "client_cert" {
  description = ""
  type        = bool
  default     = true
}

variable "organization" {
  description = ""
  type        = string
}

variable "algorithm" {
  description = ""
  type        = string
  default     = "RSA"
}
variable "rsa_bits" {
  description = ""
  type        = string
  default     = "2048"
}

variable "validity_period_hours_root" {
  description = "value"
  type = string
  default = "87600"
}

variable "validity_period_hours_intermediate" {
  description = "value"
  type = string
  default = "26280"
}
