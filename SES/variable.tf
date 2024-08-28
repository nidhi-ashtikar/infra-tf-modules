variable "configuration_set_name" {
  type = string
}

variable "reputation_metrics_enabled" {
  type    = bool
  default = false
}

variable "sending_enabled" {
  type    = bool
  default = true
}

variable "custom_redirect_domain" {
  type = string
}

variable "domain_name" {
  type = string
}

variable "dkim_record_count" {
  type = number
}

variable "dkim_record_zone_id" {
  type = string
}

variable "dkim_record_type" {
  type = string
}

variable "dkim_record_ttl" {
  type = number
}


