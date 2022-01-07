variable "peer_vpc_id" {
  type        = string
  description = "The ID of the peer VPC in AWS."
}

variable "hcp_hvn_id" {
  type        = string
  description = "The ID of the HashiCorp Virtual Network (HVN)."
}

variable "create_timeout" {
  type        = string
  description = "HVN network peering create timeout. For more details, see https://www.terraform.io/docs/configuration/resources.html#operation-timeouts"
  default     = "3m"
}

variable "delete_timeout" {
  type        = string
  description = "HVN network peering delete timeout. For more details, see https://www.terraform.io/docs/configuration/resources.html#operation-timeouts"
  default     = "5m"
}
